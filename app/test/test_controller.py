import sys, os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../../")))

import pytest
from flask import Flask, session
from app.controler.controler import Login, Usuario
from urllib.parse import urlparse, parse_qs, unquote_plus, unquote
from app.controler.controler import Registro, Login, Consulta, Actualizar, Eliminar, Enviar
from app.models.usuario import Usuario
from app.models.caso import Caso
from app.models.desastre import Desastre

@pytest.fixture
def app():
    app = Flask(__name__)
    app.secret_key = "test_secret"

    @app.route("/register", endpoint="auth.register")
    def register_page():
        return "register page"

    # Registrar ruta simulada solo una vez
    @app.route("/login", endpoint="auth.login")
    def login_page():
        return "login page"

    return app

@pytest.fixture
def login_instance():
    return Login()


#============================== Login Tests ==============================#   
def test_login_usuario_inexistente(monkeypatch, app, login_instance):
    # Simular que Usuario.get_user_by_name retorna None
    monkeypatch.setattr(Usuario, "get_user_by_name", lambda username: None)

    with app.test_request_context("/", method="POST", data={"username": "noexiste", "password": "123"}):
        resp, status = login_instance.login()
        data = resp.get_json()
        assert status == 400
        assert data["status"] == "error"
        assert "Nombre de usuario no encontrado" in data["msg"]

def test_login_contrasena_incorrecta(monkeypatch, app, login_instance):
    class DummyUser:
        username = "user1"
        password = "correct"
        estado = "01"
        rol = "User"

    monkeypatch.setattr(Usuario, "get_user_by_name", lambda username: DummyUser())

    with app.test_request_context("/", method="POST", data={"username": "user1", "password": "wrong"}):
        resp, status = login_instance.login()
        data = resp.get_json()
        assert status == 400
        assert data["status"] == "error"
        assert "Credenciales incorrectas" in data["msg"]

def test_login_usuario_inactivo(monkeypatch, app, login_instance):
    class DummyUser:
        username = "user2"
        password = "123"
        estado = "00"
        rol = "User"

    monkeypatch.setattr(Usuario, "get_user_by_name", lambda username: DummyUser())

    with app.test_request_context("/", method="POST", data={"username": "user2", "password": "123"}):
        resp, status = login_instance.login()
        data = resp.get_json()
        assert status == 400
        assert data["status"] == "warning"
        assert "Usuario inactivo" in data["msg"]

def test_login_usuario_admin_exitoso(monkeypatch, app, login_instance):
    class DummyUser:
        username = "admin1"
        password = "123"
        estado = "01"
        rol = "Admin"

    monkeypatch.setattr(Usuario, "get_user_by_name", lambda username: DummyUser())

    with app.test_request_context("/", method="POST", data={"username": "admin1", "password": "123"}):
        resp, status = login_instance.login()
        data = resp.get_json()
        assert status == 200
        assert data["status"] == "success"
        assert "administrador" in data["msg"]
        assert data["redirect"] == "/admin/dashboard"
        assert session["username"] == "admin1"

def test_login_usuario_normal_exitoso(monkeypatch, app, login_instance):
    class DummyUser:
        username = "user3"
        password = "123"
        estado = "01"
        rol = "User"

    monkeypatch.setattr(Usuario, "get_user_by_name", lambda username: DummyUser())

    with app.test_request_context("/", method="POST", data={"username": "user3", "password": "123"}):
        resp, status = login_instance.login()
        data = resp.get_json()
        assert status == 200
        assert data["status"] == "success"
        assert "usuario" in data["msg"]
        assert data["redirect"] == "/user/dashboard"
        assert session["username"] == "user3"

def test_logout(app):
    login_instance = Login()

    with app.test_request_context("/"):
        # Simular sesión activa
        session['username'] = 'user1'
        session['user_id'] = 1
        session['rol'] = 'Admin'

        # Llamar al método logout
        resp = login_instance.logout()

        # Verificar redirección
        assert resp.status_code == 302

        # URL de redirección
        location = resp.location
        assert "/login" in location
        assert "status=success" in location

        # Decodificar mensaje
        from urllib.parse import parse_qs, urlparse
        query = parse_qs(urlparse(location).query)
        msg = query.get("msg", [""])[0]
        assert "Sesión cerrada exitosamente" in unquote(msg)
#============================== Registro Tests ==============================#
def test_registro_usuario_exitoso(app, monkeypatch):
    registro = Registro()

    # Mock funciones que dependen de la base de datos o correo
    monkeypatch.setattr("app.controler.controler.Usuario", type("MockUsuario", (), {
        "documento_exists": staticmethod(lambda x: False),
        "email_exist": staticmethod(lambda x: False),
        "username_exists": staticmethod(lambda x: False),
        "insert_user_with_details": staticmethod(lambda *a, **k: True)
    }))
    monkeypatch.setattr("app.controler.controler.enviar_correo_registro", lambda *a, **k: None)
    monkeypatch.setattr("app.controler.controler.validar_edad", lambda f: 25)
    monkeypatch.setattr("app.controler.controler.validar_número_documento", lambda d: True)
    monkeypatch.setattr("app.controler.controler.validar_caracteres_consecutivos", lambda n: True)

    with app.test_request_context("/register", method="POST", data={
        "username": "usuario1",
        "password": "Passw0rd!",
        "documento": "1234567",
        "primer_nombre": "Tatiana",
        "segundo_nombre": "Maria",
        "primer_apellido": "Lopez",
        "segundo_apellido": "Garcia",
        "tipo_documento": "CC",
        "fecha_nacimiento": "1995-01-01",
        "direccion": "Calle 123 #45-67",
        "telefono": "3101234567",
        "email": "tatiana@test.com"
    }):
        resp, status = registro.registro()
        data = resp.get_json()
        assert status == 200
        assert data["status"] == "success"

def test_registro_usuario_campos_vacios(app):
    registro = Registro()
    with app.test_request_context("/register", method="POST", data={}):
        resp, status = registro.registro()
        data = resp.get_json()
        assert status == 400
        assert data["status"] == "error"
        assert "errores" in data

def test_registrar_caso_usuario_exitoso(app, monkeypatch):
    registro = Registro()

    # Mock Usuario y Caso
    monkeypatch.setattr("app.controler.controler.Usuario", type("MockUsuario", (), {
        "get_user_by_session": staticmethod(lambda: 1),
        "get_user_account": staticmethod(lambda uid: {"email":"test@test.com","nombres":"Tatiana","apellidos":"Lopez"})
    }))
    monkeypatch.setattr("app.controler.controler.Caso", type("MockCaso", (), {
        "insert_case": staticmethod(lambda *a, **k: 1),
        "get_case_by_id": staticmethod(lambda id: {"desastre": "Inundación"})
    }))
    monkeypatch.setattr("app.controler.controler.enviar_correo_caso", lambda *a, **k: None)

    with app.test_request_context("/register", method="POST", data={
        "fecha": "2025-11-06",
        "descripcion": "Inundación en el barrio",
        "direccion": "Calle 123",
        "personas_afectadas": "3",
        "tipo_desastre": "1",
        "ciudad": "Bogotá"
    }):
        resp, status = registro.registrar_caso_usuario()
        data = resp.get_json()
        assert status == 200
        assert data["status"] == "success"

def test_registrar_caso_usuario_campos_vacios(app):
    registro = Registro()
    with app.test_request_context("/register", method="POST", data={
        "fecha": "",
        "descripcion": "",
        "direccion": "",
        "personas_afectadas": "",
        "tipo_desastre": "",
        "ciudad": ""
    }):
        resp, status = registro.registrar_caso_usuario()
        data = resp.get_json()
        assert status == 400
        assert data["status"] == "warning"
#============================== Consulta Tests ==============================#
def test_buscar_caso_usuario_exitoso(monkeypatch):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Usuario", type("MockUsuario", (), {
        "get_user_by_session": staticmethod(lambda: 1)
    }))
    monkeypatch.setattr("app.controler.controler.Caso", type("MockCaso", (), {
        "get_cases_user": staticmethod(lambda uid: [{"id":1,"descripcion":"Caso prueba"}])
    }))
    casos = consulta.buscar_caso_usuario()
    assert isinstance(casos, list)
    assert len(casos) == 1

def test_buscar_caso_usuario_sin_casos(monkeypatch):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Usuario", type("MockUsuario", (), {
        "get_user_by_session": staticmethod(lambda: 1)
    }))
    monkeypatch.setattr("app.controler.controler.Caso", type("MockCaso", (), {
        "get_cases_user": staticmethod(lambda uid: [])
    }))
    casos = consulta.buscar_caso_usuario()
    assert casos == []

def test_buscar_casos_admin_exitoso(monkeypatch):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Caso", type("MockCaso", (), {
        "get_cases_admin": staticmethod(lambda: [{"id":1,"descripcion":"Caso admin"}])
    }))
    casos = consulta.buscar_casos_admin()
    assert isinstance(casos, list)
    assert len(casos) == 1

def test_buscar_casos_admin_sin_casos(monkeypatch):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Caso", type("MockCaso", (), {
        "get_cases_admin": staticmethod(lambda: [])
    }))
    casos = consulta.buscar_casos_admin()
    assert casos == []

def test_ver_datos_usuario_exitoso(app, monkeypatch):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Usuario", type("MockUsuario", (), {
        "get_user_by_session": staticmethod(lambda: 1),
        "get_user_account": staticmethod(lambda uid: {"username":"user1","contrasena":"Passw0rd!"})
    }))
    with app.test_request_context("/", method="GET"):
        session["username"] = "user1"
        resp = consulta.ver_datos_usuario()
        data = resp.get_json()
        assert "contrasena_masked" in data

def test_ver_data_usuario_admin_exitoso(monkeypatch, app):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Usuario", type("MockUsuario", (), {
        "get_user_account": staticmethod(lambda uid: {"id_usuario":1,"nombre_usuario":"user1","rol_usuario":"Admin","contrasena":"Passw0rd!"})
    }))
    with app.test_request_context("/"):
        resp = consulta.ver_data_usuario_admin(1)
        data = resp.get_json()
        assert data["id_usuario"] == 1

def test_obtener_usuarios(monkeypatch, app):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Usuario", type("MockUsuario", (), {
        "get_all_users": staticmethod(lambda: [(1,"user1"),(2,"user2")])
    }))
    with app.test_request_context("/"):
        resp = consulta.obtener_usuarios()
        data = resp.get_json()
        assert len(data) == 2

def test_gestionar_usuarios_exitoso(monkeypatch):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Usuario", type("MockUsuario", (), {
        "get_data_all_users": staticmethod(lambda: [{"id":1,"username":"user1"}])
    }))
    usuarios = consulta.gestionar_usuarios()
    assert len(usuarios) == 1

def test_buscar_desastres_exitoso(monkeypatch):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Desastre", type("MockDesastre", (), {
        "get_disasters": staticmethod(lambda: [{"id":1,"nombre":"Inundación"}])
    }))
    desastres = consulta.buscar_desastres()
    assert len(desastres) == 1

def test_generar_reporte_exitoso(monkeypatch, app):
    consulta = Consulta()
    monkeypatch.setattr("app.controler.controler.Caso", type("MockCaso", (), {
        "generate_report": staticmethod(lambda ini, fin: [{"id":1,"descripcion":"Caso"}])
    }))
    with app.test_request_context("/", method="POST", data={"FechaInicial":"2025-01-01","FechaFinal":"2025-01-10"}):
        resp = consulta.generar_reporte()
        # resp es un send_file, no jsonify, por lo que comprobamos que tenga atributo read
        assert hasattr(resp, "read") or hasattr(resp, "get_data")
#============================== Actualizar Tests ==============================#
def test_actualizar_datos_usuario_exitoso(monkeypatch, app):
    actualizar = Actualizar()

    # Simular funciones del modelo
    monkeypatch.setattr(Usuario, "get_user_by_session", lambda: 1)
    monkeypatch.setattr(Usuario, "update_user_account", lambda *args, **kwargs: True)
    monkeypatch.setattr(Usuario, "get_user_account", lambda fk: {
        "nombres": "Test",
        "apellidos": "User",
        "email": "test@example.com",
        "direccion": "Calle Falsa 123",
        "telefono": "3001234567",
        "edad": 25,
        "nombre_usuario": "usuario_test"
    })
    # Simular envío de correo
    monkeypatch.setattr("app.controler.controler.enviar_correo_actualizacion_datos", lambda *args, **kwargs: True)
    monkeypatch.setattr(Usuario, "username_exists", lambda uname: False)
    monkeypatch.setattr(Usuario, "email_exist", lambda email: False)

    # Enviar datos como form data cumpliendo todas las validaciones
    with app.test_request_context(
        "/",
        method="POST",
        data={
            "pri_nom": "Test",
            "pri_ape": "User",
            "direccion_user": "Calle Falsa 123",  # >= 10 caracteres
            "email": "test@example.com",          # dominio válido
            "telefono": "3001234567",             # válido
            "edad": "25",
            "username": "usuario1"                # entre 4 y 10 caracteres
        }
    ):
        session['username'] = 'usuario_test'
        resp = actualizar.actualizar_datos_usuario()
        if isinstance(resp, tuple):
            resp, code = resp
        else:
            code = 200
        data = resp.get_json()

    assert code == 200
    assert data["status"] == "success"
    assert "Datos actualizados correctamente" in data["msg"]

# -------------------------------
# Test actualizar_usuario_admin
# -------------------------------
def test_actualizar_usuario_admin_exitoso(monkeypatch, app):
    actualizar = Actualizar()

    # Simular funciones del modelo
    monkeypatch.setattr(Usuario, "get_user_by_id", lambda uid: True)
    monkeypatch.setattr(Usuario, "username_exists_excluding_current", lambda uname, uid: False)
    monkeypatch.setattr(Usuario, "update_user_admin", lambda **kwargs: True)
    monkeypatch.setattr(Usuario, "get_user_account", lambda uid: {
        "nombres": "Test",
        "apellidos": "User",
        "email": "test@example.com",
        "nombre_usuario": "usuario_test",
        "rol_usuario": "admin",
        "contrasena": "NewPass1!"
    })
    # Simular envío de correo
    monkeypatch.setattr("app.controler.controler.enviar_correo_actualizacion_datos_admin", lambda *args, **kwargs: True)

    with app.test_request_context(
        "/",
        method="POST",
        data={
            "user_id": 1,
            "nombre_usuario": "usuario1",  # 4-10 caracteres
            "rol": "admin",
            "password": "NewPass1!"        # cumple patrón
        }
    ):
        resp = actualizar.actualizar_usuario_admin()
        if isinstance(resp, tuple):
            resp, code = resp
        else:
            code = 200
        data = resp.get_json()

    assert code == 200
    assert data["status"] == "success"
    assert "Usuario actualizado correctamente" in data["msg"]
#============================== Eliminar Tests ==============================#
def test_eliminar_usuario_exitoso(monkeypatch, app):
    eliminar = Eliminar()

    # Mock del usuario existente
    monkeypatch.setattr(Usuario, "get_user_by_id", lambda uid: True)
    # Mock del método delete_user
    monkeypatch.setattr(Usuario, "delete_user", lambda uid: True)

    # Request con JSON válido
    with app.test_request_context(
        "/",
        method="POST",
        json={"user_id": 1}
    ):
        resp = eliminar.eliminar_usuario()
        if isinstance(resp, tuple):
            resp, code = resp
        else:
            code = 200
        data = resp.get_json()

    assert code == 200
    assert data["status"] == "success"
    assert "Usuario desactivado correctamente" in data["msg"]

# -------------------------------
# Test eliminar_usuario usuario no encontrado
# -------------------------------
def test_eliminar_usuario_no_encontrado(monkeypatch, app):
    eliminar = Eliminar()

    # Mock usuario no existe
    monkeypatch.setattr(Usuario, "get_user_by_id", lambda uid: None)

    with app.test_request_context(
        "/",
        method="POST",
        json={"user_id": 99}
    ):
        resp, code = eliminar.eliminar_usuario()
        data = resp if isinstance(resp, dict) else resp.get_json()

    assert code == 400
    assert data["status"] == "error"
    assert "Usuario no encontrado" in data["msg"]

# -------------------------------
# Test eliminar_usuario sin datos
# -------------------------------
def test_eliminar_usuario_sin_datos(app):
    eliminar = Eliminar()

    # Request vacío
    with app.test_request_context(
        "/",
        method="POST",
        json={}
    ):
        resp, code = eliminar.eliminar_usuario()
        data = resp.get_json()

    assert code == 400
    assert data["status"] == "error"
    assert "Datos no proporcionados" in data["msg"]

# -------------------------------
# Test eliminar_usuario falla eliminación
# -------------------------------
def test_eliminar_usuario_falla(monkeypatch, app):
    eliminar = Eliminar()

    # Mock usuario existente
    monkeypatch.setattr(Usuario, "get_user_by_id", lambda uid: True)
    # Mock eliminación falla
    monkeypatch.setattr(Usuario, "delete_user", lambda uid: False)

    with app.test_request_context(
        "/",
        method="POST",
        json={"user_id": 1}
    ):
        resp, code = eliminar.eliminar_usuario()
        data = resp.get_json()

    assert code == 400
    assert data["status"] == "error"
    assert "Error al desactivar usuario" in data["msg"]
#============================== Enviar Tests ==============================#
def test_enviar_registro_caso_exitoso(monkeypatch, app):
    enviar = Enviar()

    # Mock caso existente
    monkeypatch.setattr(Caso, "get_case_by_id", lambda caso_id: {
        "id_caso": 1,
        "id_desastre": 10,
        "descripcion": "Prueba de caso"
    })
    # Mock usuario asociado
    monkeypatch.setattr(Caso, "get_user_by_case", lambda caso_id: {
        "nombre_completo": "Test User",
        "email": "test@example.com",
        "num_contacto": "3001234567"
    })
    # Mock entidad responsable
    monkeypatch.setattr(Desastre, "get_entidad_by_desastre_id", lambda desastre_id: {
        "correo": "entidad@test.com",
        "nombre_entidad": "Entidad Prueba"
    })
    # Mock envío de correo
    monkeypatch.setattr("app.controler.controler.enviar_correo_caso_entidad", lambda correo, caso, nombre_entidad: True)

    # Request con JSON válido
    with app.test_request_context(
        "/",
        method="POST",
        json={"caso_id": 1}
    ):
        resp = enviar.enviar_registro_caso()
        if isinstance(resp, tuple):
            resp, code = resp
        else:
            code = 200
        data = resp.get_json()

    assert code == 200
    assert data["status"] == "success"
    assert "Correo enviado correctamente" in data["msg"]

# -------------------------------
# Test enviar_registro_caso caso no encontrado
# -------------------------------
def test_enviar_registro_caso_no_encontrado(monkeypatch, app):
    enviar = Enviar()

    monkeypatch.setattr(Caso, "get_case_by_id", lambda caso_id: None)

    with app.test_request_context(
        "/",
        method="POST",
        json={"caso_id": 99}
    ):
        resp, code = enviar.enviar_registro_caso()
        data = resp.get_json()

    assert code == 404
    assert data["status"] == "error"
    assert "Caso no encontrado" in data["msg"]

# -------------------------------
# Test enviar_registro_caso entidad no encontrada
# -------------------------------
def test_enviar_registro_caso_entidad_no_encontrada(monkeypatch, app):
    enviar = Enviar()

    monkeypatch.setattr(Caso, "get_case_by_id", lambda caso_id: {"id_caso": 1, "id_desastre": 10})
    monkeypatch.setattr(Caso, "get_user_by_case", lambda caso_id: None)
    monkeypatch.setattr(Desastre, "get_entidad_by_desastre_id", lambda desastre_id: None)

    with app.test_request_context(
        "/",
        method="POST",
        json={"caso_id": 1}
    ):
        resp, code = enviar.enviar_registro_caso()
        data = resp.get_json()

    assert code == 404
    assert data["status"] == "error"
    assert "No se encontró la información de la entidad" in data["msg"]

# -------------------------------
# Test enviar_registro_caso error interno
# -------------------------------
def test_enviar_registro_caso_error(monkeypatch, app):
    enviar = Enviar()

    # Provocar excepción al obtener el caso
    monkeypatch.setattr(Caso, "get_case_by_id", lambda caso_id: (_ for _ in ()).throw(Exception("DB Error")))

    with app.test_request_context(
        "/",
        method="POST",
        json={"caso_id": 1}
    ):
        resp, code = enviar.enviar_registro_caso()
        data = resp.get_json()

    assert code == 500
    assert data["status"] == "error"
    assert "Error al enviar el correo" in data["msg"]