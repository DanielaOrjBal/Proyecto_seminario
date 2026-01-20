# app/routes/auth.py
from flask import Blueprint
from app.controler.controler import Login
from app.controler.controler import Registro, Actualizar


auth_bp = Blueprint('auth', __name__, url_prefix='/auth')

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():     
    return Login().login()

@auth_bp.route('/register', methods=['GET', 'POST'])
def register():
    return Registro().registro()

@auth_bp.route('/logout')
def logout():
    return Login().logout()

@auth_bp.route('/forget_password', methods=['GET', 'POST'])
def forget_password():
    return Actualizar().recuperar_contrasena()


   

