import bcrypt
import os
from app.db import Conexion

pepper = os.getenv('PASSWORD_PEPPER', '')

class Usuario:
    def __init__(self, id_usuario=None, username=None, password=None, rol=None, estado=None):
        self.id_usuario = id_usuario
        self.username = username
        self.password = password
        self.rol = rol
        self.estado = estado

    @staticmethod
    def hash_password(plain_password):
        password_with_pepper = plain_password + pepper
        salt = bcrypt.gensalt()
        hashed = bcrypt.hashpw(password_with_pepper.encode('utf-8'), salt)
        return hashed.decode('utf-8')

    def verificar_contrasena(self, plain_password):
        password_with_pepper = plain_password + pepper
        return bcrypt.checkpw(
            password_with_pepper.encode('utf-8'),
            self.password.encode('utf-8')
        )

    # ======================== Métodos de consulta general ========================

    @classmethod
    def get_user_by_name(cls, username):
        """Obtiene usuario por nombre (login) usando procedimiento almacenado."""
        db = Conexion()
        sql = "CALL sp_get_user_by_name(%s)"
        row = db.execute_query(sql, (username,), fetchone=True)
        if row:
            # row: (Id_usuario, Nombre, Contrasena, Rol, fk_estado)
            return cls(id_usuario=row[0], username=row[1], password=row[2], rol=row[3], estado=row[4])
        return None

    @classmethod
    def get_user_by_role(cls, username):
        """Obtiene rol del usuario por nombre usando función."""
        sql = "SELECT fn_get_user_role(%s)"
        db = Conexion()
        row = db.execute_query(sql, (username,), fetchone=True)
        return row[0] if row else None

    @classmethod
    def get_user_password(cls, fk_usuario):
        """Obtiene contraseña por ID de usuario usando función."""
        sql = "SELECT fn_get_user_password(%s)"
        db = Conexion()
        row = db.execute_query(sql, (fk_usuario,), fetchone=True)
        return row[0] if row else None

    @classmethod
    def get_user_by_state(cls, username):
        """Obtiene estado del usuario por nombre usando función."""
        sql = "SELECT fn_get_user_state(%s)"
        db = Conexion()
        row = db.execute_query(sql, (username,), fetchone=True)
        return row[0] if row else None

    @classmethod
    def get_email_user(cls, fk_persona):
        """Obtiene email del usuario por ID de persona usando función."""
        sql = "SELECT fn_get_user_email(%s)"
        db = Conexion()
        row = db.execute_query(sql, (fk_persona,), fetchone=True)
        return row[0] if row else None

    @classmethod
    def get_id_user(cls, fk_usuario):
        """Obtiene ID de persona por ID de usuario usando función."""
        sql = "SELECT fn_get_persona_id_by_user(%s)"
        db = Conexion()
        row = db.execute_query(sql, (fk_usuario,), fetchone=True)
        return row[0] if row else None

    @classmethod
    def get_user_by_id(cls, user_id):
        """Obtiene usuario por ID usando procedimiento."""
        try:
            sql = "CALL sp_get_user_by_id(%s)"
            db = Conexion()
            result = db.execute_query(sql, (user_id,), fetchone=True)
            return result
        except Exception as e:
            print(f"Error al obtener usuario: {e}")
            return None

    @classmethod
    def get_user_id(cls, username):
        """Obtiene ID de usuario por nombre usando función."""
        sql = "SELECT fn_get_user_id(%s)"
        db = Conexion()
        row = db.execute_query(sql, (username,), fetchone=True)
        return row[0] if row else None

    @classmethod
    def get_all_users_system(cls):
        sql = "SELECT fn_total_usuarios()"
        db = Conexion()
        row = db.execute_query(sql, fetchone=True)
        return row[0] if row else 0
    @classmethod
    def get_all_users_deactivate_system(cls):
        sql = "SELECT fn_total_usuarios_inactivos()"
        db = Conexion()
        row = db.execute_query(sql, fetchone=True)
        return row[0] if row else 0
    
    @classmethod
    def get_all_users(cls):
        """Lista de usuarios activos con rol 'User' usando vista."""
        sql = "SELECT Id_usuario, nombre_completo FROM vw_usuarios_activos ORDER BY nombre_completo"
        try:
            db = Conexion()
            return db.execute_query(sql, fetchall=True)
        except Exception as e:
            print(f"Error al obtener usuarios: {e}")
            return []

    @classmethod
    def get_data_all_users(cls):
        """Datos completos de todos los usuarios usando vista."""
        try:
            sql = "SELECT * FROM vw_datos_completos_usuarios ORDER BY Id_Usuario"
            db = Conexion()
            rows = db.execute_query(sql, fetchall=True)
            if not rows:
                print("No se encontró información de usuarios")
                return []

            usuarios = []
            for row in rows:
                # La vista devuelve 13 campos (sin Id_Rol)
                usuario = {
                    "documento": row[0],
                    "nombres": row[1],
                    "apellidos": row[2],
                    "id_usuario": row[3],
                    "nombre_usuario": row[4],
                    "contrasena": row[5],
                    "rol_usuario": row[6],
                    "estado_usuario": row[7],
                    "direccion": row[8],
                    "email": row[9],
                    "telefono": row[10],
                    "edad": row[11],
                    "tipo_documento": row[12]
                }
                usuarios.append(usuario)
            return usuarios
        except Exception as e:
            print(f"Error al obtener usuarios: {e}")
            return []

    # ======================== Métodos para manejo de datos del usuario ========================

    @classmethod
    def username_exists(cls, username):
        """Verifica existencia de nombre de usuario usando función."""
        sql = "SELECT fn_username_exists(%s)"
        db = Conexion()
        row = db.execute_query(sql, (username,), fetchone=True)
        return row is not None and row[0] == 1

    @classmethod
    def username_exists_excluding_current(cls, username, current_user_id):
        """Verifica existencia de nombre de usuario excluyendo el actual."""
        try:
            sql = "SELECT fn_username_exists_excluding(%s, %s)"
            db = Conexion()
            row = db.execute_query(sql, (username, current_user_id), fetchone=True)
            return row is not None and row[0] == 1
        except Exception as e:
            print(f"Error al verificar nombre de usuario: {e}")
            return True

    @classmethod
    def documento_exists(cls, id_persona):
        """Verifica existencia de documento (Id_Persona) usando función."""
        sql = "SELECT fn_documento_exists(%s)"
        db = Conexion()
        row = db.execute_query(sql, (id_persona,), fetchone=True)
        return row is not None and row[0] == 1

    @classmethod
    def email_exist(cls, email):
        """Verifica existencia de email usando función."""
        sql = "SELECT fn_email_exists(%s)"
        db = Conexion()
        row = db.execute_query(sql, (email,), fetchone=True)
        return row is not None and row[0] == 1

    @classmethod
    def insert_user_with_details(cls,
                                 username, password_hash,
                                 id_persona, pri_nom, seg_nom, pri_ape, seg_ape,
                                 tipo_doc, fecha_nac,
                                 edad, direccion, telefono, email,
                                 fk_rol="User", fk_estado="01"):
        """Inserta un nuevo usuario usando procedimiento almacenado."""
        db = Conexion()
        conn = db.get_connection()
        cursor = conn.cursor()
        try:
            # Llamar al procedimiento
            cursor.callproc('sp_insert_user', (
                username, password_hash, id_persona, pri_nom, seg_nom, pri_ape, seg_ape,
                tipo_doc, fecha_nac, edad, direccion, telefono, email, fk_rol, fk_estado
            ))
            # El procedimiento devuelve el Id_usuario en un conjunto de resultados
            id_usuario = None
            for result in cursor.stored_results():
                row = result.fetchone()
                if row:
                    id_usuario = row[0]
                    break
            conn.commit()
            return id_usuario
        except Exception as e:
            conn.rollback()
            print("Error al insertar usuario:", e)
            raise e
        finally:
            cursor.close()
            conn.close()

    @classmethod
    def get_user_account(cls, fk_usuario):
        """Obtiene datos completos del usuario usando procedimiento."""
        try:
            sql = "CALL sp_get_user_account(%s)"
            db = Conexion()
            row = db.execute_query(sql, (fk_usuario,), fetchone=True)
            if not row:
                print("No se encontró información del usuario con ID:", fk_usuario)
                return None

            usuario = {
                "documento": row[0],
                "nombres": row[1],
                "apellidos": row[2],
                "id_usuario": row[3],
                "nombre_usuario": row[4],
                "contrasena": row[5],
                "rol_usuario": row[6],
                "estado_usuario": row[7],
                "direccion": row[8],
                "email": row[9],
                "telefono": row[10],
                "edad": row[11],
                "tipo_documento": row[12]
            }
            return usuario
        except Exception as e:
            print(f"Error al obtener datos de usuario: {e}")
            return None

    @classmethod
    def update_user_account(cls, fk_usuario, pri_nom, seg_nom, pri_ape, seg_ape,
                            direccion, email, telefono, edad, username):
        """Actualiza los datos del usuario usando procedimiento."""
        db = Conexion()
        try:
            sql = """
                CALL sp_update_user_account(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """
            db.execute_query(sql, (fk_usuario, pri_nom, seg_nom, pri_ape, seg_ape,
                                   direccion, email, telefono, edad, username),
                             commit=True)
            print("Datos de usuario actualizados correctamente")
            return True
        except Exception as e:
            print(f"Error al actualizar los datos del usuario: {e}")
            return False

    @classmethod
    def change_user_password(cls, fk_usuario, new_password):
        """Cambia la contraseña del usuario usando procedimiento."""
        db = Conexion()
        try:
            sql = "CALL sp_change_user_password(%s, %s)"
            db.execute_query(sql, (fk_usuario, new_password), commit=True)
            print("Contraseña actualizada correctamente")
            return True
        except Exception as e:
            print(f"Error al actualizar la contraseña: {e}")
            return False

    @classmethod
    def delete_user(cls, id_usuario, fk_estado="00"):
        """Desactiva un usuario (cambia estado a '00') usando procedimiento."""
        try:
            sql = "CALL sp_deactivate_user(%s)"
            db = Conexion()
            db.execute_query(sql, (id_usuario,), commit=True)
            print("Usuario desactivado correctamente")
            return True
        except Exception as e:
            print(f"Error al desactivar usuario: {e}")
            return False

    @classmethod
    def update_user_admin(cls, user_id, username=None, fk_rol=None, contrasena=None):
        """Actualiza usuario desde administración usando procedimiento."""
        db = Conexion()
        try:
            # El procedimiento sp_update_user_admin acepta NULL para campos que no se actualizan
            sql = "CALL sp_update_user_admin(%s, %s, %s, %s)"
            db.execute_query(sql, (user_id, username, fk_rol, contrasena), commit=True)
            print(f"Usuario {user_id} actualizado exitosamente")
            return True
        except Exception as e:
            print(f"Error al actualizar usuario desde admin: {e}")
            return False

    @classmethod
    def get_user_activity(cls, user_id, limit=10):
        sql = "CALL sp_get_user_activity(%s, %s)"
        db = Conexion()
        rows = db.execute_query(sql, (user_id, limit), fetchall=True)
        activities = []
        for row in rows:
            activities.append({
                'id': row[0],
                'username': row[1],
                'accion': row[2],
                'descripcion': row[3],
                'created_at': row[4].strftime('%Y-%m-%d %H:%M:%S')  # format datetime
            })
        return activities

    
    @classmethod
    def insert_historical(cls, user_id, username, action, description):
        db = Conexion()
        try:
            sql = "INSERT INTO historical (username, Fk_usuario, Accion, Descripcion) VALUES (%s, %s, %s, %s)"
            db.execute_query(sql, (username, user_id, action, description), commit=True)
            return True
        except Exception as e:
            print(f"Error inserting historical record: {e}")
            return False
            