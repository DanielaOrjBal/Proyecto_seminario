// Función para mostrar errores en el formulario
function mostrarErroresFormulario(errores) {
    limpiarErroresFormulario();

    const idioma = localStorage.getItem("vitaria_idioma") || "es";
    const traducciones = window.traduccionesToasts ? window.traduccionesToasts[idioma] : {};
    
    // Mostrar  errores
    Object.keys(errores).forEach(campo => {
        const input = document.querySelector(`[name="${campo}"]`);
        if (input) {
            // Agregar clase de error al input
            input.classList.add('is-invalid');
            
            // Crear o actualizar el mensaje de error
            let errorElement = input.parentNode.querySelector('.invalid-feedback');
            if (!errorElement) {
                errorElement = document.createElement('div');
                errorElement.className = 'invalid-feedback';
                input.parentNode.appendChild(errorElement);
            }
            
            let mensajeOriginal = errores[campo];
            
             let mensajeTraducido = traducciones && traducciones[mensajeOriginal] 
                ? traducciones[mensajeOriginal] 
                : mensajeOriginal; 

            errorElement.textContent = mensajeTraducido;

            
            // Scroll al primer error
            if (Object.keys(errores)[0] === campo) {
                input.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }
    });
}

function limpiarErroresFormulario() {
    // Remover clases de error
    document.querySelectorAll('.is-invalid').forEach(element => {
        element.classList.remove('is-invalid');
    });
    
    // Remover mensajes de error
    document.querySelectorAll('.invalid-feedback').forEach(element => {
        element.remove();
    });
}

function manejarExitoFormulario(mensaje) {
    limpiarErroresFormulario();
    showToast(mensaje, "success");
}

function configurarValidacionTiempoReal() {
    const inputs = document.querySelectorAll('input, select');
    inputs.forEach(input => {
        input.addEventListener('input', function() {
            if (this.classList.contains('is-invalid')) {
                this.classList.remove('is-invalid');
                const errorElement = this.parentNode.querySelector('.invalid-feedback');
                if (errorElement) {
                    errorElement.remove();
                }
            }
        });
    });
}