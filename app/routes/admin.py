"""
Vistas de administrador
"""

# app/routes/admin.py
from flask import Blueprint, render_template, request, redirect, url_for, session,jsonify
from app.controler.controler import Registro,Consulta,Eliminar,Actualizar,Enviar
from app.models.caso import Caso
from app.models.usuario import Usuario
from functools import wraps
from flask_jwt_extended import (
    get_jwt_identity,
    get_jwt,
    verify_jwt_in_request
)

admin_bp = Blueprint('admin', __name__, url_prefix='/admin')

# ── Decorador para rutas HTML ───────────────────────────────────────────────
def admin_html_required(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        try:
            verify_jwt_in_request()
        except Exception:
            return redirect(url_for('auth.login'))

        claims = get_jwt()
        if claims.get('rol') != 'Admin':
            return redirect(url_for('auth.login'))

        return fn(*args, **kwargs)
    return wrapper

# ── Decorador para rutas ────────────────────────────────────────
def admin_api_required(fn):
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
        if claims.get('rol') != 'Admin':
            return jsonify({
                "status": "error",
                "msg": "Acceso no autorizado."
            }), 403

        return fn(*args, **kwargs)
    return wrapper

# ── Rutas ───────────────────────────────────────────────────────────────────


@admin_bp.route('/dashboard')
@admin_html_required
def dashboard():
    return render_template('admin/admin_dashboard.html')


@admin_bp.route('/dashboard/stats')
@admin_api_required                          
def dashboard_stats():
    user_id = get_jwt_identity()         
    claims = get_jwt()
    username = claims.get('username')
    
    # Obtener estadísticas de casos
    total_casos = Caso.total_casos_sistema()
    casos_enviados = Caso.casos_enviados_sistema()
    casos_cerrados = Caso.casos_cerrados_sistema()
    usuario = Usuario.get_user_account(user_id)
    usuarios = Usuario.get_all_users_system()
    usuarios_inactivos = Usuario.get_all_users_deactivate_system()
    casos_incendio = Caso.casos_incendio_sistema()
    casos_inundacion = Caso.casos_inundacion_sistema()
    casos_sismo = Caso.casos_sismo_sistema() 

    
    return render_template(
        'admin/partials/dashboard_stats.html',
        username=username,
        usuario=usuario,
        total_casos=total_casos,
        casos_enviados=casos_enviados,
        casos_cerrados=casos_cerrados,
        usuarios_registrados=usuarios,
        usuarios_inactivos = usuarios_inactivos,
        casos_incendio=casos_incendio,
        casos_inundacion=casos_inundacion,
        casos_sismo=casos_sismo,
    )

@admin_bp.route('/consult/cases')
@admin_api_required
def register_form():
    return render_template('admin/partials/consult_cases.html')

@admin_bp.route('/consult/users')
@admin_api_required
def consult_list():
    return render_template('admin/partials/consult_users.html')

@admin_bp.route('/report/form')
@admin_api_required
def report():
    return render_template('admin/partials/reports.html')

@admin_bp.route('/account/info')
@admin_api_required
def account_info():
    user_id = get_jwt_identity()
    usuario = Usuario.get_user_account(user_id)
    return render_template('admin/partials/account_info.html', usuario=usuario)

@admin_bp.route('/query_cases')
@admin_api_required                          
def query_cases():
    casos = Consulta().buscar_casos_admin()
    return jsonify(casos)

@admin_bp.route('/enviar_correo_caso', methods=['POST'])
@admin_api_required                          
def send_case():
    return Enviar().enviar_registro_caso()

@admin_bp.route('/update_case', methods=['POST'])
@admin_api_required                          
def update_cases():
    return Actualizar().actualizar_estado_caso()


@admin_bp.route('/generate_report', methods=["GET", "POST"])
@admin_api_required                          
def generate_report():
    return Consulta().generar_reporte()

@admin_bp.route('/manage-account', methods=["GET"])
@admin_api_required                          
def manage_account():
    return Consulta().ver_datos_usuario()

@admin_bp.route('/update_account', methods=['POST'])
@admin_api_required                          
def update_account():
    return Actualizar().actualizar_datos_usuario()

@admin_bp.route('/change_password', methods=['POST'])
@admin_api_required                          
def change_password():
    return Actualizar().cambiar_contrasena_usuario()

@admin_bp.route('/select_users')
@admin_api_required                          
def select():
    return Consulta().obtener_usuarios()

@admin_bp.route('/query_users')
@admin_api_required                          
def query_users():
    return Consulta().obtener_usuarios()

@admin_bp.route('/query_disasters')
@admin_api_required                          
def query_disasters():
    desastres = Consulta().buscar_desastres()
    return jsonify(desastres)

@admin_bp.route('/manage_users')
@admin_api_required                          
def manage_users():
    usuarios = Consulta().gestionar_usuarios()
    return jsonify(usuarios)

@admin_bp.route('/get_data_user/<user_id>')
@admin_api_required                          
def get_data_user(user_id):
    return Consulta().ver_data_usuario_admin(user_id)

@admin_bp.route('/update_user', methods=['POST'])
@admin_api_required                          
def update_user():
    return Actualizar().actualizar_usuario_admin()

@admin_bp.route('/delete_user',methods=['DELETE'] )
@admin_api_required                          
def delete_user():
    return Eliminar().eliminar_usuario()


