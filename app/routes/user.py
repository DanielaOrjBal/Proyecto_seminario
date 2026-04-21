"""
Rutas de Usuario
app/routes/user.py
"""
from flask import Blueprint, render_template, jsonify, redirect, url_for, request
from app.controler.controler import Registro, Consulta, Actualizar
from app.models.caso import Caso
from app.models.usuario import Usuario
from flask_jwt_extended import (
    get_jwt_identity,
    get_jwt,
    verify_jwt_in_request
)
from functools import wraps

user_bp = Blueprint('user', __name__, url_prefix='/user')

# ── Decorador para rutas HTML ───────────────────────────────────────────────
def user_html_required(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        try:
            verify_jwt_in_request()
        except Exception:
            return redirect(url_for('auth.login'))

        claims = get_jwt()
        if claims.get('rol') != 'User':
            return redirect(url_for('auth.login'))

        return fn(*args, **kwargs)
    return wrapper

# ── Decorador para rutas ────────────────────────────────────────
def user_api_required(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        try:
            verify_jwt_in_request()
        except Exception:
            return jsonify({
                "status": "error",
                "msg": "Sesión expirada. Por favor inicie sesión nuevamente."
            }), 401

        claims = get_jwt()
        if claims.get('rol') != 'User':
            return jsonify({
                "status": "error",
                "msg": "Acceso no autorizado."
            }), 403

        return fn(*args, **kwargs)
    return wrapper

# ── Rutas ───────────────────────────────────────────────────────────────────

@user_bp.route('/dashboard')
@user_html_required
def dashboard():
    # Página principal con menú y contenedor dinámico
    return render_template('usuario/user_dashboard.html')

@user_bp.route('/dashboard/stats')
@user_api_required                          
def dashboard_stats():
    user_id = get_jwt_identity()         
    claims = get_jwt()
    username = claims.get('username')

    # Obtener estadísticas de casos
    total_casos = Caso.total_casos_persona(user_id)
    casos_enviados = Caso.casos_enviados_persona(user_id)
    casos_cerrados = Caso.casos_cerrados_persona(user_id)  
    casos_incendio = Caso.casos_incendio_usuario(user_id)
    casos_inundacion = Caso.casos_inundacion_usuario(user_id)
    casos_sismo = Caso.casos_sismo_usuario(user_id) 
    usuario = Usuario.get_user_account(user_id)
    actividades = Usuario.get_user_activity(user_id, 4)
    
    return render_template(
        'usuario/partials/dashboard_stats.html',
        username=username,
        usuario=usuario,
        total_casos=total_casos,
        casos_enviados=casos_enviados,
        casos_cerrados=casos_cerrados,
        casos_incendio=casos_incendio,
        casos_inundacion=casos_inundacion,
        casos_sismo=casos_sismo,
        actividades=actividades
    )

@user_bp.route('/register/form')
@user_api_required 
def register_form():
    return render_template('usuario/partials/register.html')

@user_bp.route('/consult/list')
@user_api_required 
def consult_list():
    return render_template('usuario/partials/consult_list.html')

@user_bp.route('/account/info')
@user_api_required 
def account_info():
    user_id = get_jwt_identity()
    usuario = Usuario.get_user_account(user_id)
    return render_template('usuario/partials/account_info.html', usuario=usuario)

# Cambiado a api_required porque devuelve JSON. 
# Si necesitas que devuelva HTML en GET, avísame y te muestro cómo separarlas.
@user_bp.route("/register_case", methods=["POST"])
@user_api_required                          
def register_case():
    return Registro().registrar_caso_usuario()

# Cambiado a api_required porque ver_datos_usuario devuelve jsonify
@user_bp.route('/manage-account', methods=["GET"])
@user_api_required
def manage_account():
    return Consulta().ver_datos_usuario()

@user_bp.route("/query_cases", methods=["GET"])
@user_api_required                           
def query_cases():
    return jsonify(Consulta().buscar_caso_usuario()) # Ajuste menor para asegurar formato JSON

@user_bp.route('/update_account', methods=['POST'])
@user_api_required
def update_account():
    return Actualizar().actualizar_datos_usuario()

@user_bp.route('/change_password', methods=['POST'])
@user_api_required
def change_password():
    return Actualizar().cambiar_contrasena_usuario()