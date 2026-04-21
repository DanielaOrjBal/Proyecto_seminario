# app/__init__.py
from flask import Flask, render_template, session
from app.routes.auth import auth_bp
from app.routes.admin import admin_bp
from app.routes.user import user_bp
from app.extensions import mail
from dotenv import load_dotenv
import os
from flask_jwt_extended import JWTManager 
from datetime import timedelta     

def create_app():
    
    app = Flask(__name__)
    app.secret_key = 'VitariaSOSAuthenticated'  
     
    load_dotenv()
    
    app.config['JWT_SECRET_KEY'] = os.getenv('JWT_SECRET_KEY')
    app.config['JWT_TOKEN_LOCATION'] = ['cookies']           
    app.config['JWT_COOKIE_SECURE'] = False                  
    app.config['JWT_COOKIE_CSRF_PROTECT'] = False         
    app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(minutes=int(os.getenv('JWT_ACCESS_TOKEN_EXPIRES_MINUTES', 5)))

    jwt = JWTManager(app)
    
    @jwt.unauthorized_loader
    def unauthorized_callback(reason):
        """Token ausente"""
        from flask import request, redirect, url_for, jsonify
        if request.accept_mimetypes.accept_json and \
        not request.accept_mimetypes.accept_html:
            return jsonify({"status": "error", "msg": f"No autorizado: {reason}"}), 401
        return redirect(url_for('auth.login'))

    @jwt.expired_token_loader
    def expired_token_callback(jwt_header, jwt_payload):
        """Token expirado"""
        from flask import request, redirect, url_for, jsonify
        if request.accept_mimetypes.accept_json and \
        not request.accept_mimetypes.accept_html:
            return jsonify({"status": "error", "msg": "Sesión expirada."}), 401
        return redirect(url_for('auth.login'))

    @jwt.invalid_token_loader
    def invalid_token_callback(reason):
        """Token malformado o firma inválida"""
        from flask import request, redirect, url_for, jsonify
        if request.accept_mimetypes.accept_json and \
        not request.accept_mimetypes.accept_html:
            return jsonify({"status": "error", "msg": f"Token inválido: {reason}"}), 422
        return redirect(url_for('auth.login'))

    
    app.config['MAIL_SERVER'] = os.getenv('MAIL_SERVER')
    app.config['MAIL_PORT'] = int(os.getenv('MAIL_PORT'))
    app.config['MAIL_USE_TLS'] = os.getenv('MAIL_USE_TLS') == 'True'
    app.config['MAIL_USERNAME'] = os.getenv('MAIL_USERNAME')
    app.config['MAIL_PASSWORD'] = os.getenv('MAIL_PASSWORD')
    app.config['MAIL_DEFAULT_SENDER'] = os.getenv('MAIL_DEFAULT_SENDER')
        
    mail.init_app(app)
    
    # Registrar blueprints
    app.register_blueprint(auth_bp)
    app.register_blueprint(admin_bp)
    app.register_blueprint(user_bp)
    
    @app.route('/')
    def home():
        return render_template('home.html')
    
    return app
