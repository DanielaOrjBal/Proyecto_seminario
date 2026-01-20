"""
Vistas de administrador
"""

# app/routes/admin.py
from flask import Blueprint, render_template, request, redirect, url_for, session,jsonify
from app.controler.controler import Registro,Consulta,Eliminar,Actualizar,Enviar


admin_bp = Blueprint('admin', __name__, url_prefix='/admin')

@admin_bp.route('/dashboard')
def dashboard():
    return render_template('admin_dashboard.html', username = session["username"])


@admin_bp.route('/register_case', methods=["GET", "POST"])
def register_case():
    return Registro().registrar_caso_usuario()

@admin_bp.route('/query_cases')
def query_cases():
    casos = Consulta().buscar_casos_admin()
    return jsonify(casos)

@admin_bp.route('/enviar_correo_caso', methods=['POST'])
def send_case():
    return Enviar().enviar_registro_caso()

@admin_bp.route('/generate_report', methods=["GET", "POST"])
def generate_report():
    return Consulta().generar_reporte()

@admin_bp.route('/manage-account', methods=["GET"])
def manage_account():
    return Consulta().ver_datos_usuario()

@admin_bp.route('/update_account', methods=['POST'])
def update_account():
    return Actualizar().actualizar_datos_usuario()

@admin_bp.route('/change_password', methods=['POST'])
def change_password():
    return Actualizar().cambiar_contrasena_usuario()

@admin_bp.route('/select_users')
def select():
    return Consulta().obtener_usuarios()

@admin_bp.route('/query_users')
def query_users():
    return Consulta().obtener_usuarios()

@admin_bp.route('/query_disasters')
def query_disasters():
    desastres = Consulta().buscar_desastres()
    return jsonify(desastres)

@admin_bp.route('/manage_users')
def manage_users():
    usuarios = Consulta().gestionar_usuarios()
    return jsonify(usuarios)

@admin_bp.route('/get_data_user/<user_id>')
def get_data_user(user_id):
    return Consulta().ver_data_usuario_admin(user_id)

@admin_bp.route('/update_user', methods=['POST'])
def update_user():
    return Actualizar().actualizar_usuario_admin()

@admin_bp.route('/delete_user',methods=['DELETE'] )
def delete_user():
    return Eliminar().eliminar_usuario()


