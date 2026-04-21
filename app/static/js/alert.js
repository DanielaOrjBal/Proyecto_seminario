// Verificar que Bootstrap esté disponible
if (typeof bootstrap === 'undefined') {
    console.error('Bootstrap JS no está cargado. La funcionalidad de toasts no funcionará.');
}

// Asegura que el elemento toast exista en el DOM
function ensureToastElement() {
    let toastEl = document.getElementById("toast");
    if (!toastEl) {
        toastEl = document.createElement("div");
        toastEl.id = "toast";
        toastEl.className =
            "toast align-items-center text-white border-0 position-fixed top-0 start-50 translate-middle-x";
        toastEl.style.zIndex = "99999";
        toastEl.style.marginTop = "2vh";
        toastEl.style.minWidth = "320px";
        toastEl.style.maxWidth = "420px";

        toastEl.innerHTML = `
            <div class="d-flex">
                <div id="toast-message" class="toast-body fw-semibold"></div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Cerrar"></button>
            </div>
        `;

        document.body.appendChild(toastEl);
    }
    return toastEl;
}

// Muestra un mensaje tipo toast
function showToast(message, type = "success") {
    if (typeof bootstrap === 'undefined') {
        alert(message); // Fallback si Bootstrap no existe
        return;
    }

    const toastEl = ensureToastElement();
    const msgElement = toastEl.querySelector("#toast-message");

    if (!msgElement) return;

    msgElement.textContent = message || "";

    // Limpiar clases de color anteriores
    toastEl.classList.remove("bg-success", "bg-danger", "bg-warning");

    // Aplicar color según el tipo
    if (type === "success") {
        toastEl.classList.add("bg-success");
    } else if (type === "error") {
        toastEl.classList.add("bg-danger");
    } else {
        toastEl.classList.add("bg-warning");
    }

    // Asegurar posición y visibilidad
    toastEl.style.zIndex = "99999";
    toastEl.style.position = "fixed";
    toastEl.style.top = "3rem";
    toastEl.style.left = "50%";
    toastEl.style.transform = "translateX(-50%)";

    // Destruir instancia previa si existe
    const existingToast = bootstrap.Toast.getInstance(toastEl);
    if (existingToast) {
        existingToast.dispose();
    }

    // Inicializar y mostrar el toast de Bootstrap
    const toast = new bootstrap.Toast(toastEl, { delay: 3000, autohide: true });
    toast.show();
}

function hideToast() {
    const toastEl = document.getElementById("toast");
    if (toastEl && typeof bootstrap !== 'undefined') {
        const toast = bootstrap.Toast.getInstance(toastEl);
        if (toast) toast.hide();
    }
}

// Detectar parámetros en la URL al cargar la página
document.addEventListener("DOMContentLoaded", () => {
    const params = new URLSearchParams(window.location.search);
    const status = params.get("status");
    const msg = params.get("msg");

    if (status && msg) {
        const decodedMsg = decodeURIComponent(msg);
        showToast(decodedMsg, status);
    }

    const sessionMsg = sessionStorage.getItem("toastMessage");
    const sessionType = sessionStorage.getItem("toastType");
    if (sessionMsg && sessionType) {
        showToast(sessionMsg, sessionType);
        sessionStorage.removeItem("toastMessage");
        sessionStorage.removeItem("toastType");
    }

    // Limpiar los parámetros de la URL después de mostrar el toast
    if (window.history.replaceState) {
        const url = window.location.origin + window.location.pathname;
        window.history.replaceState(null, null, url);
    }
});