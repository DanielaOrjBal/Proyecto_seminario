
function ensureToastElement() {
  let toastEl = document.getElementById("toast");
  if (!toastEl) {
    // Crear contenedor global si no existe
    toastEl = document.createElement("div");
    toastEl.id = "toast";
    toastEl.className =
      "toast align-items-center text-white border-0 position-fixed top-0 start-50 translate-middle-x";
    toastEl.style.zIndex = "99999"; // superior a los modales
    toastEl.style.marginTop = "1.5rem"; // separación desde arriba
    toastEl.style.minWidth = "320px";
    toastEl.style.maxWidth = "420px";

    toastEl.innerHTML = `
      <div class="d-flex">
        <div id="toast-message" class="toast-body fw-semibold"></div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" aria-label="Cerrar"></button>
      </div>
    `;

    document.body.appendChild(toastEl);
    toastEl.style.zIndex = 99999;

    const closeBtn = toastEl.querySelector(".btn-close");
    closeBtn.addEventListener("click", () => {
      const instance = bootstrap.Toast.getInstance(toastEl);
      if (instance) instance.hide();
    });
  }
  toastEl.style.pointerEvents = "none";
  return toastEl;
}

// --- Helpers de normalización ---
function normalizeTextKey(text) {
  if (!text && text !== "") return text;
  // Trim y colapsar espacios
  let t = String(text).trim().replace(/\s+/g, " ");

  // Opcional: remover comillas envolventes
  t = t.replace(/^["'`]+|["'`]+$/g, "");

  // Reemplazar entidades HTML comunes (si vienen codificadas)
  t = t.replace(/&nbsp;/gi, " ").replace(/&amp;/gi, "&");

  return t;
}

function stripPunctuationAndEmojis(text) {
  if (!text && text !== "") return text;
  // Eliminar emojis (bastante efectivo) y signos de puntuación especiales,
  // pero mantiene letras y números y acentos.
  // Nota: esta expresión no es perfecta para todos los emojis, pero cubre muchos casos.
  return text
    .normalize("NFKD") // normalizar diacríticos
    .replace(/[\u{1F300}-\u{1F6FF}\u{1F900}-\u{1F9FF}\u{1F1E6}-\u{1F1FF}]/gu, "") // emojis
    .replace(/[^\w\sÀ-ÿ\u00C0-\u017F\-.,:;()¿?¡!]/g, "") // quitar otros símbolos raros
    .replace(/\s+/g, " ")
    .trim();
}

// Busca traducción con varias estrategias
function findTranslationForMessage(originalMessage, idioma) {
  if (!originalMessage) return null;
  const dict = window.traduccionesToasts || {};
  const langDict = dict[idioma] || {};

  const raw = String(originalMessage);
  const normalized = normalizeTextKey(raw);

  // 1) Búsqueda exacta tal cual vino
  if (langDict[raw]) {
    console.debug("[i18n-toast] matched exact:", raw);
    return langDict[raw];
  }

  // 2) Búsqueda por 'normalized' (trimm, colapsar espacios, quitar quotes)
  if (normalized !== raw && langDict[normalized]) {
    console.debug("[i18n-toast] matched normalized:", normalized, "from:", raw);
    return langDict[normalized];
  }

  // 3) Búsqueda en minúsculas
  const rawLower = raw.toLowerCase();
  const normalizedLower = normalized.toLowerCase();
  // Buscar en dict por claves en minúscula (preparar índice lento)
  for (const key in langDict) {
    if (key.toLowerCase() === rawLower) {
      console.debug("[i18n-toast] matched lower exact:", key);
      return langDict[key];
    }
    if (key.toLowerCase() === normalizedLower) {
      console.debug("[i18n-toast] matched lower normalized:", key);
      return langDict[key];
    }
  }

  // 4) Búsqueda sin puntuación ni emojis (más tolerante)
  const stripped = stripPunctuationAndEmojis(normalized);
  if (stripped && stripped !== normalized) {
    for (const key in langDict) {
      const keyStripped = stripPunctuationAndEmojis(normalizeTextKey(key));
      if (keyStripped && keyStripped.toLowerCase() === stripped.toLowerCase()) {
        console.debug("[i18n-toast] matched stripped:", key, "=>", stripped);
        return langDict[key];
      }
    }
  }

  // 5) Búsqueda por coincidencia parcial: si el mensaje recibido contiene la clave (o viceversa)
  // Útil para mensajes largos que incluyen dinámicos (ej. "El campo X ... debe tener mínimo 4 caracteres")
  for (const key in langDict) {
    try {
      const keyNorm = normalizeTextKey(key).toLowerCase();
      const rawNorm = normalized.toLowerCase();
      if (rawNorm.includes(keyNorm) || keyNorm.includes(rawNorm)) {
        console.debug("[i18n-toast] matched partial:", key, "in", raw);
        return langDict[key];
      }
    } catch (e) {
      // ignore
    }
  }

  // No coincidencia encontrada
  console.debug("[i18n-toast] no match for:", originalMessage);
  return null;
}

// --- showToast mejorada ---
function showToast(message, type = "success") {
  const toastEl = ensureToastElement();
  const msg = toastEl.querySelector("#toast-message");

  const idioma = localStorage.getItem("vitaria_idioma") || "es";

  // Normalizar el mensaje original tal cual lo recibe la función
  const originalMessage = message;
  let mensajeTraducido = null;

  // Intentar traducción mediante varias estrategias
  try {
    mensajeTraducido = findTranslationForMessage(originalMessage, idioma);
  } catch (err) {
    console.error("Error searching translation:", err);
  }

  // Si no hay traducción, mostrar el original (fallback)
  const finalMessage = mensajeTraducido || originalMessage || "";

  // Asignar texto al toast
  msg.textContent = finalMessage;

  // Colores según tipo
  toastEl.classList.remove("bg-success", "bg-danger", "bg-warning");

  if (type === "success") toastEl.classList.add("bg-success");
  else if (type === "error") toastEl.classList.add("bg-danger");
  else toastEl.classList.add("bg-warning");

  toastEl.style.zIndex = "99999";
  toastEl.style.position = "fixed";
  toastEl.style.top = "1.5rem";
  toastEl.style.left = "50%";
  toastEl.style.transform = "translateX(-50%)";

  // Inicializar toast de Bootstrap
  const toast = new bootstrap.Toast(toastEl, { delay: 3000, autohide: true });
  toast.show();
}

function hideToast() {
  const toastEl = document.getElementById("toast");
  const toast = bootstrap.Toast.getInstance(toastEl);
  if (toast) toast.hide();
}

// Detectar parámetros en la URL
document.addEventListener("DOMContentLoaded", () => {
  const params = new URLSearchParams(window.location.search);
  const status = params.get("status");
  const msg = params.get("msg");
  const message = sessionStorage.getItem("toastMessage");
  const type = sessionStorage.getItem("toastType");

  if (status && msg) {
    const decodedMsg = decodeURIComponent(msg);
    showToast(decodedMsg, status);
  }

  if (message && type) {
    showToast(message, type);
    sessionStorage.removeItem("toastMessage");
    sessionStorage.removeItem("toastType");
  }

  // Limpiar parámetros de la URL después de mostrar el toast
  if (window.history.replaceState) {
    const url = window.location.origin + window.location.pathname;
    window.history.replaceState(null, null, url);
  }
});

