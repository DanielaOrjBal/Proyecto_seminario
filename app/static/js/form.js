// ========== FUNCIONES AUXILIARES ==========
function tieneCaracteresConsecutivos(texto, maxConsecutivos = 4) {
    if (!texto || texto.length < maxConsecutivos) return false;
    const upperText = texto.toUpperCase();
    let consecutivos = 1;
    let anterior = upperText[0];
    for (let i = 1; i < upperText.length; i++) {
        if (upperText[i] === anterior) {
            consecutivos++;
            if (consecutivos >= maxConsecutivos) return true;
        } else {
            consecutivos = 1;
            anterior = upperText[i];
        }
    }
    return false;
}

function tieneNumerosConsecutivos(texto, maxConsecutivos = 6) {
    if (!texto || texto.length < maxConsecutivos) return false;
    let consecutivos = 1;
    let anterior = texto[0];
    for (let i = 1; i < texto.length; i++) {
        if (texto[i] === anterior) {
            consecutivos++;
            if (consecutivos >= maxConsecutivos) return true;
        } else {
            consecutivos = 1;
            anterior = texto[i];
        }
    }
    return false;
}

function calcularEdad(fechaNacimiento) {
    const hoy = new Date();
    const nacimiento = new Date(fechaNacimiento);
    let edad = hoy.getFullYear() - nacimiento.getFullYear();
    const mes = hoy.getMonth() - nacimiento.getMonth();
    if (mes < 0 || (mes === 0 && hoy.getDate() < nacimiento.getDate())) {
        edad--;
    }
    return edad;
}

// ========== PATRONES ==========
const patrones = {
    nombres: /^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]{2,}$/,
    direccion: /^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s#\-.,]+$/,
    email: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|co)$/,
    password: /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.,;:\-_])[A-Za-z\d@$!%*?&.,;:\-_]{8,}$/
};

// ========== VALIDACIONES ==========
function validarPrimerNombre(valor) {
    valor = valor.trim();
    if (!valor) return "Este campo es obligatorio";
    if (!patrones.nombres.test(valor)) return "Debe contener solo letras y espacios, con mínimo 3 caracteres";
    if (tieneCaracteresConsecutivos(valor)) return "No puede tener 3 o más letras iguales consecutivas";
    return null;
}

function validarSegundoNombre(valor) {
    valor = valor.trim();
    if (!valor) return null;
    if (!patrones.nombres.test(valor)) return "Debe contener solo letras y espacios, con mínimo 3 caracteres";
    if (tieneCaracteresConsecutivos(valor)) return "No puede tener 3 o más letras iguales consecutivas";
    return null;
}

function validarPrimerApellido(valor) {
    valor = valor.trim();
    if (!valor) return "Este campo es obligatorio";
    if (!patrones.nombres.test(valor)) return "Debe contener solo letras y espacios, con mínimo 4 caracteres";
    if (tieneCaracteresConsecutivos(valor)) return "No puede tener 4 o más letras iguales consecutivas";
    return null;
}

function validarSegundoApellido(valor) {
    valor = valor.trim();
    if (!valor) return null;
    if (!patrones.nombres.test(valor)) return "Debe contener solo letras y espacios, con mínimo 4 caracteres";
    if (tieneCaracteresConsecutivos(valor)) return "No puede tener 4 o más letras iguales consecutivas";
    return null;
}

function validarFechaNacimiento(valor) {
    if (!valor) return "Este campo es obligatorio";
    const edad = calcularEdad(valor);
    if (isNaN(edad)) return "La fecha de nacimiento no es válida";
    if (edad < 18) return "Debe ser mayor de 18 años para registrarse";
    if (edad > 90) return "La edad debe estar entre 18 y 90 años";
    return null;
}

function validarDireccion(valor) {
    valor = valor.trim();
    if (!valor) return "Este campo es obligatorio";
    if (valor.length < 10) return "La dirección debe tener un mínimo de 10 caracteres";
    if (!patrones.direccion.test(valor)) return "Solo puede contener letras, números, espacios y los caracteres # - . ,";
    return null;
}

function validarTelefono(valor) {
    valor = valor.trim();
    if (!valor) return "Este campo es obligatorio";
    if (!/^\d{10}$/.test(valor)) return "El número de teléfono debe tener 10 dígitos";
    return null;
}

function validarEmailLocal(valor) {
    valor = valor.trim().toLowerCase();
    if (!valor) return "Este campo es obligatorio";
    if (!patrones.email.test(valor)) return "Debe tener un dominio válido (.com o .co)";
    return null;
}

function validarUsernameLocal(valor) {
    valor = valor.trim();
    if (!valor) return "Este campo es obligatorio";
    if (valor.length < 4 || valor.length > 10) return "El nombre de usuario debe tener entre 4 y 10 caracteres";
    return null;
}

function validarPassword(valor) {
    if (!valor) return "Este campo es obligatorio";
    if (!patrones.password.test(valor)) {
        return "Debe tener mínimo 8 caracteres, una mayúscula, un número y un caracter especial";
    }
    return null;
}

function validarDocumentoLocal(valor, tipoDoc) {
    valor = valor.trim();
    if (!valor) return "Este campo es obligatorio";
    if (!/^\d+$/.test(valor)) return "El número de documento debe contener solo dígitos";
    if (valor.length < 6) return "El número de documento debe tener mínimo 6 dígitos";
    if (tieneNumerosConsecutivos(valor, 6)) return "No puede contener 6 o más números consecutivos iguales";
    return null;
}


// ========== VALIDACIONES PARA FORMULARIO DE CASOS ==========

/**
 * Valida que la fecha no sea posterior a hoy ni anterior al 2000-01-01.
 * (Replica la lógica de validar_fecha del backend)
 */
function validarFechaCaso(valor) {
    if (!valor) return "Este campo es obligatorio";

    const fechaIngresada = new Date(valor);
    const hoy = new Date();
    hoy.setHours(0, 0, 0, 0); // Normalizar a medianoche para comparar solo fechas

    const fechaMinima = new Date("2000-01-01");

    if (isNaN(fechaIngresada.getTime())) {
        return "La fecha no es válida";
    }
    if (fechaIngresada > hoy) {
        return "La fecha no puede ser posterior a la actual";
    }
    if (fechaIngresada < fechaMinima) {
        return "La fecha no puede ser anterior al 1 de enero del 2000";
    }
    return null;
}

/**
 * Valida el número de personas afectadas: dígitos, entre 1 y 25.
 */
function validarPersonasAfectadas(valor) {
    valor = valor.trim();
    if (!valor) return "Este campo es obligatorio";
    if (!/^\d+$/.test(valor)) return "Debe ser un número entero positivo";
    const num = parseInt(valor, 10);
    if (num < 1 || num > 25) {
        return "El número de personas debe estar entre 1 y 25 (núcleo familiar)";
    }
    return null;
}

/**
 * Valida que el campo descripción no esté vacío.
 * (El contador de caracteres ya gestiona la longitud máxima)
 */
function validarDescripcionCaso(valor) {
    valor = valor.trim();
    if (!valor) return "Este campo es obligatorio";
    if (valor.length < 10) return "La descripción debe tener al menos 10 caracteres";
    return null;
}
/**
 * Valida que se haya seleccionado un tipo de desastre.
 */
function validarTipoDesastre(valor) {
    if (!valor) return "Debe seleccionar un tipo de desastre";
    return null;
}

/**
 * Valida que al menos una ciudad esté seleccionada en el <select multiple>.
 */
function validarCiudad(selectElement) {
    // selectElement es el elemento DOM, no solo el valor
    if (!selectElement) return "Error interno: campo ciudad no encontrado";
    const selectedOptions = selectElement.selectedOptions;
    if (selectedOptions.length === 0) {
        return "Debe seleccionar un municipio";
    } if (selectedOptions.length > 1) {
        return "Debe seleccionar UNA SOLA OPCIÓN";
    }
    return null;
}

// ========== VALIDACIONES PARA FORMULARIO DE REPORTES ==========
function validarRangoFechas(fechaInicio, fechaFin) {
    if (!fechaInicio || !fechaFin) return null;

    const inicio = new Date(fechaInicio);
    const fin = new Date(fechaFin);

    if (isNaN(inicio.getTime()) || isNaN(fin.getTime())) {
        return "Las fechas no son válidas";
    }

    if (inicio > fin) {
        return "La fecha inicial no puede ser mayor a la fecha final";
    }

    return null;
}

// ========== MANEJO DE ERRORES EN FORMULARIO ==========
function mostrarErroresFormulario(errores) {
    limpiarErroresFormulario();

    Object.keys(errores).forEach(campo => {
        const input = document.querySelector(`[name="${campo}"]`);
        if (input) {
            input.classList.add('is-invalid');

            let errorElement = input.parentNode.querySelector('.invalid-feedback');
            if (!errorElement) {
                errorElement = document.createElement('div');
                errorElement.className = 'invalid-feedback';
                input.parentNode.appendChild(errorElement);
            }

            errorElement.textContent = errores[campo];

            if (Object.keys(errores)[0] === campo) {
                input.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }
    });
}

function limpiarErroresFormulario() {
    document.querySelectorAll('.is-invalid').forEach(element => {
        element.classList.remove('is-invalid');
    });

    document.querySelectorAll('.invalid-feedback').forEach(element => {
        element.remove();
    });
}

function manejarExitoFormulario(mensaje) {
    limpiarErroresFormulario();
    if (typeof showToast === 'function') {
        showToast(mensaje, "success");
    }
}

// ========== VALIDACIÓN EN TIEMPO REAL ==========
function configurarValidacionTiempoReal() {
    const form = document.querySelector('form[action*="/auth/register"]');
    if (!form) return;

    const campos = {
        'primer_nombre': validarPrimerNombre,
        'segundo_nombre': validarSegundoNombre,
        'primer_apellido': validarPrimerApellido,
        'segundo_apellido': validarSegundoApellido,
        'fecha_nacimiento': validarFechaNacimiento,
        'direccion': validarDireccion,
        'telefono': validarTelefono,
        'email': validarEmailLocal,
        'username': validarUsernameLocal,
        'password': validarPassword,
        'documento': (valor) => {
            const tipoDocSelect = form.querySelector('select[name="tipo_documento"]');
            const tipoDoc = tipoDocSelect ? tipoDocSelect.value : '';
            return validarDocumentoLocal(valor, tipoDoc);
        }
    };

    Object.keys(campos).forEach(nombreCampo => {
        const input = form.querySelector(`[name="${nombreCampo}"]`);
        if (!input) return;

        input.addEventListener('input', function () {
            const valor = this.value;
            const fnValidar = campos[nombreCampo];
            const errorMsg = fnValidar(valor);
            mostrarErrorCampo(this, errorMsg);
        });
    });

    const tipoDocSelect = form.querySelector('select[name="tipo_documento"]');
    if (tipoDocSelect) {
        tipoDocSelect.addEventListener('change', function () {
            const errorMsg = this.value ? null : "Este campo es obligatorio";
            mostrarErrorCampo(this, errorMsg);
            const docInput = form.querySelector('[name="documento"]');
            if (docInput && docInput.value.trim()) {
                const errorDoc = validarDocumentoLocal(docInput.value.trim(), this.value);
                mostrarErrorCampo(docInput, errorDoc);
            }
        });
    }

    const fechaInicioInput = form.querySelector('[name="FechaInicial"]');
    const fechaFinInput = form.querySelector('[name="FechaFinal"]');

    function validarFechasRelacionadas() {
        const error = validarRangoFechas(
            fechaInicioInput.value,
            fechaFinInput.value
        );

        mostrarErrorCampo(fechaInicioInput, error);
        mostrarErrorCampo(fechaFinInput, error);
    }

    if (fechaInicioInput && fechaFinInput) {
        fechaInicioInput.addEventListener('change', validarFechasRelacionadas);
        fechaFinInput.addEventListener('change', validarFechasRelacionadas);
    }
}

function mostrarErrorCampo(input, mensaje) {
    input.classList.remove('is-invalid');
    const parent = input.closest('.form-group') || input.parentNode;
    let errorEl = parent.querySelector('.invalid-feedback');
    if (errorEl) errorEl.remove();

    if (mensaje) {
        input.classList.add('is-invalid');
        errorEl = document.createElement('div');
        errorEl.className = 'invalid-feedback';
        errorEl.textContent = mensaje;
        parent.appendChild(errorEl);
    }
}

function configurarValidacionTiempoRealCaso() {
    const form = document.getElementById('registerCaseForm');
    if (!form) return;

    // Mapa de campos a funciones validadoras
    const campos = {
        'fecha': validarFechaCaso,
        'descripcion': validarDescripcionCaso,
        'direccion': validarDireccion,
        'personas_afectadas': validarPersonasAfectadas,
        'tipo_desastre': validarTipoDesastre,
        'ciudad': (valor, input) => validarCiudad(input)  // para select multiple se pasa el elemento
    };

    // Para campos simples: input/select/textarea
    Object.keys(campos).forEach(nombreCampo => {
        const input = form.querySelector(`[name="${nombreCampo}"]`);
        if (!input) return;

        const eventType = (input.tagName === 'SELECT' && input.multiple) ? 'change' : 'input';

        input.addEventListener(eventType, function () {
            let errorMsg;
            if (nombreCampo === 'ciudad') {
                errorMsg = campos[nombreCampo](null, this);
            } else {
                errorMsg = campos[nombreCampo](this.value);
            }
            mostrarErrorCampo(this, errorMsg);
        });
    });
}