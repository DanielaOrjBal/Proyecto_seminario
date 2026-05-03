document.addEventListener('DOMContentLoaded', () => {

    function loadSection(url) {
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Sesión expirada, ingrese nuevamente');
                    window.location.href = `/auth/login?status=warning&msg=${msg}`;
                    return null;
                }
                return response.text();
            })
            .then(html => {
                const container = document.getElementById('dynamic-content');
                container.innerHTML = html;

                // Ejecutar scripts del HTML cargado
                const scripts = container.querySelectorAll("script");

                scripts.forEach(oldScript => {
                    const newScript = document.createElement("script");

                    if (oldScript.src) {
                        newScript.src = oldScript.src;
                    } else {
                        newScript.textContent = oldScript.textContent;
                    }

                    document.body.appendChild(newScript);
                    oldScript.remove();
                });

                // Iicializar gráficos
                setTimeout(() => {
                    initChartsIfNeeded();
                }, 50);
            })
            .catch(err => {
                console.error(err);
                if (typeof showToast === 'function') {
                    showToast(err.message, 'error');
                }
            });
    }

    function initChartsIfNeeded() {

        if (typeof Chart === "undefined") {
            console.error("Chart.js no está disponible");
            return;
        }

        const canvas = document.getElementById("casosChart");
        if (!canvas || !window.statsData) return;

        new Chart(document.getElementById("casosChart"), {
            type: 'pie',
            data: {
                labels: ['Incendio', 'Inundación', 'Sismo'],
                datasets: [{
                    data: window.statsData.casos,
                    backgroundColor: ['#f56a5b', '#65baf3', '#f8d95d'],
                }]
            },
            options: {
                plugins: {
                    legend: {
                        labels: {
                            generateLabels: function (chart) {
                                const data = chart.data;
                                return data.labels.map((label, i) => {
                                    const value = data.datasets[0].data[i];
                                    return {
                                        text: `${label} (${value})`,
                                        fillStyle: data.datasets[0].backgroundColor[i],
                                        index: i
                                    };
                                });
                            }
                        }

                    },
                    datalabels: {
                        color: '#053e7a',
                        font: {
                            weight: 'bold',
                            size: 14
                        },
                        formatter: (value, context) => {
                            const data = context.chart.data.datasets[0].data;

                            const total = data.reduce((a, b) => a + b, 0);
                            const percentage = ((value / total) * 100).toFixed(1);

                            return percentage + '%';
                        }
                    }
                }
            },
            plugins: [ChartDataLabels]
        });

        new Chart(document.getElementById("usuariosChart"), {
            type: 'pie',
            data: {
                labels: ['Activos', 'Inactivos'],
                datasets: [{
                    data: window.statsData.usuarios,
                    backgroundColor: ['#65f384', '#f56a5b' ],
                }]
            },
            options: {
                plugins: {
                    legend: {
                        labels: {
                            generateLabels: function (chart) {
                                const data = chart.data;
                                return data.labels.map((label, i) => {
                                    const value = data.datasets[0].data[i];
                                    return {
                                        text: `${label} (${value})`,
                                        fillStyle: data.datasets[0].backgroundColor[i],
                                        index: i
                                    };
                                });
                            }
                        }

                    },
                    datalabels: {
                        color: '#053e7a',
                        font: {
                            weight: 'bold',
                            size: 14
                        },
                        formatter: (value, context) => {
                            const data = context.chart.data.datasets[0].data;

                            const total = data.reduce((a, b) => a + b, 0);
                            const percentage = ((value / total) * 100).toFixed(1);

                            return percentage + '%';
                        }
                    }
                }
            },
            plugins: [ChartDataLabels]
        });
    }

    // RUTAS 
    function resolveRoute(section) {
        if (section === 'dashboard') return '/admin/dashboard/stats';
        if (section === 'consult_cases') return '/admin/consult/cases';
        if (section === 'consult_users') return '/admin/consult/users';
        if (section === 'reports') return '/admin/report/form';
        if (section === 'account') return '/admin/account/info';
        return null;
    }

    // Inicial
    loadSection('/admin/dashboard/stats');

    // Eventos navbar
    document.querySelectorAll('.nav-link[data-section]').forEach(link => {
        link.addEventListener('click', e => {
            e.preventDefault();
            const section = link.dataset.section;
            const url = resolveRoute(section);
            if (url) loadSection(url);
        });
    });

});