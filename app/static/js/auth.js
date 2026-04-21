// static/js/auth.js
// Cargarlo en los templates que requieran autenticación

const Auth = (() => {

    // ── Fetch autenticado central ─────────────────────────────────────────────
    async function fetchAuth(url, opciones = {}) {
        let response;

        try {
            response = await fetch(url, {
                ...opciones,
                credentials: 'include'        // siempre envía la cookie JWT
            });
        } catch (error) {
            // Error de red (sin conexión, servidor caído)
            showToast("Error de conexión. Verifique su red. ❌", "error");
            return null;
        }

        // Token ausente o expirado (401)
        if (response.status === 401) {
            const msg = encodeURIComponent("Sesión expirada, ingrese nuevamente. ⚠");
            window.location.href = `/auth/login?status=warning&msg=${msg}`;
            return null;
        }

        // Sin permisos para esa ruta
        if (response.status === 403) {
            showToast("No tiene permisos para esta acción. ❌", "error");
            return null;
        }

        // Error del servidor
        if (response.status >= 500) {
            showToast("Error interno del servidor. Intente más tarde. ❌", "error");
            return null;
        }

        return response;
    }

    // ── Fetch que devuelve JSON directamente ──────────────────────────────────
    async function fetchJSON(url, opciones = {}) {
        const response = await fetchAuth(url, opciones);
        if (!response) return null;

        try {
            return await response.json();
        } catch {
            showToast("Sesión expirada. Ingrese nuevamente. ❌", "error");
            window.location.href = "/auth/login";
            return null;
        }
    }

    // ── Fetch para enviar FormData y devolver JSON ────────────────────────────
    async function fetchFormData(url, formData) {
        const response = await fetchAuth(url, {
            method: 'POST',
            body: formData
        });

        if (!response) return null;

        try {
            return await response.json();
        } catch {
            showToast("Error al procesar la respuesta del servidor. ❌", "error");
            window.location.href = "/auth/login";
            return null;
        }
    }

    // ── LOGOUT VOLUNTARIO ─────────────────────────────────────────────────────
    async function logout() {
        try {
            const response = await fetch("/auth/logout", {
                method: "POST",
                credentials: 'include'
            });

            // Si el backend procesó la salida y nos redirige con mensaje de éxito:
            if (response.redirected) {
                window.location.href = response.url;
                return;
            }
        } catch (error) {
            console.error("Error durante el cierre de sesión:", error);
        }
        window.location.href = "/auth/login";
        showToast("Sesión expirada. Ingrese nuevamente. ❌", "error");
    }

    // API pública del módulo
    return { fetchAuth, fetchJSON, fetchFormData, logout };
})();