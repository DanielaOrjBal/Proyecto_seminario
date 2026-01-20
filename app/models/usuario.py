from flask import session
from app.db import Conexion
from flask import session

class Usuario:
    def __init__(self, id_usuario=None, username=None, password=None, rol=None, estado=None):
        self.id_usuario = id_usuario
        self.username = username
        self.password = password
        self.rol = rol
        self.estado = estado

    # ======================== Métodos de consulta general ========================
    #Obtener datos de usuario por nombre (login)
    @classmethod
    def get_user_by_name(cls, username):
        sql = """
            SELECT Id_usuario, Nombre, Contrasena, fk_rol, fk_estado
            FROM tbl_usuario
            WHERE BINARY Nombre = %s
        """
        db = Conexion()
        row = db.execute_query(sql, (username,), fetchone=True)
        if row:
            return cls(id_usuario=row[0], username=row[1], password=row[2], rol=row[3], estado=row[4])
        return None

    #Obtener rol del usuario por nombre
    @classmethod
    def get_user_by_role(cls, username):
        sql = "SELECT fk_rol FROM tbl_usuario WHERE Nombre = %s"
        db = Conexion()
        row = db.execute_query(sql, (username,), fetchone=True)
        return row[0] if row else None
    
    #Obtener id del usuario por sesión
    @classmethod
    def get_user_by_session(cls):
        username = session.get("username")
        if not username:
            return None

        conn = Conexion()
        row = conn.execute_query(
            "SELECT Id_usuario FROM tbl_usuario WHERE Nombre = %s",
            (username,), fetchone=True
        )
        return row[0] if row else None

    #Obtener contraseña del usuario por id
    @classmethod
    def get_user_password(cls, fk_usuario):
        sql = "SELECT Contrasena FROM tbl_usuario WHERE Id_usuario = %s"
        db = Conexion()
        row = db.execute_query(sql, (fk_usuario,), fetchone=True)
        return row[0] if row else None
    
    #Obtener estado del usuario por nombre
    @classmethod
    def get_user_by_state(cls, username):
        sql = "SELECT fk_estado FROM tbl_usuario WHERE Nombre = %s"
        db = Conexion()
        row = db.execute_query(sql, (username,), fetchone=True)
        return row[0] if row else None
    
    # Obtener correo usuario
    @classmethod
    def get_email_user(cls,fk_persona):
        sql = "SELECT Email FROM tbl_adic_persona WHERE fk_persona = %s"
        db = Conexion()
        row = db.execute_query(sql, (fk_persona,), fetchone=True)
        return row[0] if row else None
    
    @classmethod
    def get_id_user(cls,fk_usuario):
        sql= "SELECT Id_Persona FROM tbl_persona WHERE fk_usuario = %s;"
        db= Conexion()
        row = db.execute_query(sql, (fk_usuario,), fetchone=True, )
        return row[0] if row else None
    
    @classmethod
    def get_user_by_id(cls, user_id):
        try:
            sql = """
                SELECT * FROM tbl_usuario 
                WHERE Id_usuario = %s;
            """
            db = Conexion()
            result = db.execute_query(sql, (user_id,), fetchone=True)
            return result
        except Exception as e:
            print(f"Error al obtener usuario: {e}")
            return None
        
        
    @classmethod
    def get_all_users(cls):
        conexion = Conexion()
        sql = """
            SELECT Id_usuario, Nombre AS nombre_completo
        FROM tbl_usuario
        WHERE fk_estado = '01' AND fk_rol = 'User'
        ORDER BY Nombre;
        """
        try:
            return conexion.execute_query(sql, fetchall=True)
        except Exception as e:
            print(f"Error al obtener usuarios: {e}")
            return []
        
    @classmethod
    def get_data_all_users(cls):
        try:
            sql = """
                SELECT 
                    p.Id_Persona AS Documento,
                    CONCAT(p.Pri_Nom, ' ', IFNULL(p.Seg_Nom, '')) AS Nombres,
                    CONCAT(p.Pri_Ape, ' ', IFNULL(p.Seg_Ape, '')) AS Apellidos,
                    u.Id_usuario AS Id_Usuario,
                    u.Nombre AS Nombre_Usuario,
                    u.Contrasena AS Contrasena,
                    r.Rol AS Rol_Usuario,
                    e.Estado AS Estado_Usuario,
                    a.Direccion,
                    a.Email,
                    a.Num_Contact AS Telefono,
                    a.Edad,
                    t.Tipo_Documento           
                FROM tbl_usuario u
                INNER JOIN tbl_persona p ON p.fk_usuario = u.Id_usuario
                INNER JOIN tbl_adic_persona a ON a.fk_persona = p.Id_Persona
                INNER JOIN tbl_estado e ON e.Id_Estado = u.fk_estado
                INNER JOIN tbl_rol r ON r.id_rol = u.fk_rol
                INNER JOIN tbl_tipo_documento t ON t.Id_Documento = p.fk_Tipo_documento
                ORDER BY u.Id_usuario;
            """
            db = Conexion()
            rows = db.execute_query(sql, fetchall=True)
            if not rows:
                print("No se encontró información de usuarios")
                return []
            
            usuarios = []
            for row in rows:
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
    # Validar existencia de usuario o documento
    @classmethod
    def username_exists(cls, username):
        sql = "SELECT 1 FROM tbl_usuario WHERE Nombre = %s"
        db = Conexion()
        row = db.execute_query(sql, (username,), fetchone=True)
        return row is not None
    
    @classmethod
    def username_exists_excluding_current(cls, username, current_user_id):
        try:
            sql = "SELECT Id_usuario FROM tbl_usuario WHERE Nombre = %s AND Id_usuario != %s;"
            db = Conexion()
            result = db.execute_query(sql, (username, current_user_id), fetchone=True)
            return result is not None
        except Exception as e:
            print(f"Error al verificar nombre de usuario: {e}")
            return True
    
    # Validar existencia de documento
    @classmethod
    def documento_exists(cls, id_persona):
        sql = "SELECT 1 FROM tbl_persona WHERE Id_Persona = %s"
        db = Conexion()
        row = db.execute_query(sql, (id_persona,), fetchone=True)
        return row is not None
    
    @classmethod
    def email_exist(cls,email):
        sql = "SELECT 1 FROM tbl_adic_persona WHERE Email = %s"
        db = Conexion()
        row = db.execute_query(sql, (email,), fetchone=True)
        return row is not None
    
    # Insertar nuevo usuario en las tablas correspondientes
    @classmethod
    def insert_user_with_details(cls,
                                 username, password,
                                 id_persona, pri_nom, seg_nom, pri_ape, seg_ape,
                                 tipo_doc, fecha_nac,
                                 edad, direccion, telefono, email,
                                 fk_rol="User", fk_estado="01"):
       
        db = Conexion()
        conn = db.get_connection()
        cursor = conn.cursor()
        try:
            # 1. Insertar datos en tbl_usuario
            sql_usuario = """
            INSERT INTO tbl_usuario (Nombre, Contrasena, fk_rol, fk_estado)
            VALUES (%s, %s, %s, %s)
            """            
            cursor.execute(sql_usuario, (username, password, fk_rol, fk_estado))
            
            cursor.execute("SELECT LAST_INSERT_ID()")
            id_usuario = cursor.fetchone()[0]

            # 2. Insertar datos en tbl_persona
            sql_persona = """
            INSERT INTO tbl_persona
            (Id_Persona, Pri_Nom, Seg_Nom, Pri_Ape, Seg_Ape, fk_Tipo_documento, Fecha_nacimiento, fk_usuario)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(sql_persona, (
            id_persona, pri_nom, seg_nom, pri_ape, seg_ape, tipo_doc, fecha_nac, id_usuario))
            
            # 3. Insertar datos en tbl_adic_persona
            id_adic_persona = f"{id_persona}-1"
            sql_adic_persona = """
            INSERT INTO tbl_adic_persona
            (Id_Adic_Persona, Edad, Direccion, Num_Contact, Email, fk_persona)
            VALUES (%s, %s, %s, %s, %s, %s)
            """
            cursor.execute(sql_adic_persona, (
            id_adic_persona, edad, direccion, telefono, email, id_persona))

            conn.commit()
            return id_usuario

        except Exception as e:
            conn.rollback()
            print("Error al insertar usuario:", e) # Mensaje de error en consola
            raise e
        finally:
            cursor.close() # Cerrar el cursor
    
    # Obtener datos completos del usuario 
    @classmethod
    def get_user_account(cls,fk_usuario):
        try:
             #Consulta SQL 
            sql = """
            SELECT 
                p.Id_Persona AS Documento,
                CONCAT(p.Pri_Nom, ' ', IFNULL(p.Seg_Nom, '')) AS Nombres,
                CONCAT(p.Pri_Ape, ' ', IFNULL(p.Seg_Ape, '')) AS Apellidos,
                u.Id_usuario AS Id_Usuario,
                u.Nombre AS Nombre_Usuario,
                u.Contrasena AS Contrasena,
                r.Rol AS Rol_Usuario,
                r.id_rol AS Id_Rol,
                e.Estado AS Estado_Usuario,
                a.Direccion,
                a.Email,
                a.Num_Contact AS Telefono,
                a.Edad,
                t.Tipo_Documento           
            FROM tbl_usuario u
            INNER JOIN tbl_persona p ON p.fk_usuario = u.Id_usuario
            INNER JOIN tbl_adic_persona a ON a.fk_persona = p.Id_Persona
            INNER JOIN tbl_estado e ON e.Id_Estado = u.fk_estado
            INNER JOIN tbl_rol r ON r.id_rol = u.fk_rol
            INNER JOIN tbl_tipo_documento t ON t.Id_Documento = p.fk_Tipo_documento
            WHERE u.Id_usuario = %s;
            """

            db = Conexion()
            row = db.execute_query(sql, (fk_usuario,), fetchone=True)

            if not row:
                print("No se encontró información del usuario con ID:", fk_usuario)
                return None

            # Formatear los datos en un diccionario legible y accesible
            usuario = {
                "documento": row[0],
                "nombres": row[1],
                "apellidos": row[2],
                "id_usuario": row[3],  
                "nombre_usuario": row[4],
                "contrasena": row[5],
                "rol_usuario": row[6],
                "id_rol": row[7],  
                "estado_usuario": row[8],
                "direccion": row[9],
                "email": row[10],
                "telefono": row[11],
                "edad": row[12],
                "tipo_documento": row[13]
            }
            return usuario
        except Exception as e:
            print(f"Error al obtener datos de usuario: {e}")
            return None
    
    # Actualizar datos del usuario
    @classmethod
    def update_user_account(cls, fk_usuario, pri_nom, seg_nom, pri_ape, seg_ape, direccion, email,telefono, edad, username):
        
        db = Conexion()
        try:
            # Obtener el Id_Persona asociado al fk_usuario
            sql_persona = "SELECT Id_Persona FROM tbl_persona WHERE fk_usuario = %s;"
            row = db.execute_query(sql_persona, (fk_usuario,), fetchone=True, )
            
            # Validar que se encontró una persona asociada al usuario
            if not row:
                print("No se encontró ninguna persona con ese usuario =", fk_usuario)
                raise ValueError("No se encontró persona asociada a este usuario.")
            id_persona = row[0]
            
            # Obtener los datos actuales para mantener aqiellos que no se actualizan
            sql_datos_actuales = """
            SELECT 
                p.Pri_Nom, p.Seg_Nom, p.Pri_Ape, p.Seg_Ape, 
                a.Direccion, a.Email, a.Num_Contact, a.Edad, u.Nombre
            FROM tbl_persona p
            INNER JOIN tbl_adic_persona a ON a.fk_persona = p.Id_Persona
            INNER JOIN tbl_usuario u ON p.fk_usuario = u.Id_usuario
            WHERE p.Id_Persona = %s;
            """
            datos = db.execute_query(sql_datos_actuales, (id_persona,), fetchone=True)
            if not datos:
                raise ValueError("No se pudieron obtener los datos actuales del usuario.")
            
            # Usar los datos actuales si no se proporcionan nuevos valores
            pri_nom = pri_nom if pri_nom is not None else datos[0]
            seg_nom = seg_nom if seg_nom is not None else datos[1]
            pri_ape = pri_ape if pri_ape is not None else datos[2]
            seg_ape = seg_ape if seg_ape is not None else datos[3]
            direccion = direccion if direccion is not None else datos[4]
            email = email if email is not None else datos[5]
            telefono = telefono if telefono is not None else datos[6]
            edad = edad if edad is not None else datos[7]
            username = username if username is not None else datos[8] 
                
            # Actualizar el nombre de usuario en tbl_usuario
            sql_update_user = """
                UPDATE tbl_usuario
                SET Nombre = %s
                WHERE Id_usuario = %s;
            """
            db.execute_query(sql_update_user, (username, fk_usuario), commit=True)
            print("Nombre de usuario actualizado correctamente")
            
            # Actualizar los datos personales
            sql_update_persona = """
                UPDATE tbl_persona
                SET Pri_Nom = %s, Seg_Nom = %s, Pri_Ape = %s, Seg_Ape = %s
                WHERE Id_Persona = %s;
            """
            db.execute_query(sql_update_persona, (pri_nom, seg_nom, pri_ape, seg_ape, id_persona), commit=True)

            # Actualizar los datos adicionales
            sql_update_adicional = """
                UPDATE tbl_adic_persona
                SET Direccion = %s, Email = %s,Num_Contact = %s, Edad = %s
                WHERE fk_persona = %s;
            """
            db.execute_query(sql_update_adicional, (direccion, email, telefono, edad, id_persona), commit=True)
            return True

        except Exception as e:
            print(f"Error al actualizar los datos del usuario: {e}") # Mensaje de error en consola
            return False
    
    # Cambiar la contraseña del usuario
    @classmethod
    def change_user_password(cls, fk_usuario, new_password):
        db = Conexion()
        try:
            # Actualizar la contraseña en la base de datos
            sql_update_password = """
                UPDATE tbl_usuario
                SET Contrasena = %s
                WHERE Id_usuario = %s;
            """
            db.execute_query(sql_update_password, (new_password, fk_usuario), commit=True)
            print("Contraseña actualizada correctamente") # Mensaje de éxito en consola
            return True
        except Exception as e:
            print(f"Error al actualizar la contraseña: {e}") # Mensaje de error en consola
            return False
    
    @classmethod
    def delete_user(cls,id_usuario, fk_estado="00"):
        try:
            sql = """
                UPDATE tbl_usuario
                SET fk_estado = %s
                WHERE Id_usuario = %s;
            """
            db = Conexion()
            db.execute_query(sql, (fk_estado, id_usuario), commit=True)
            
            print("Uusario desactiva correctamente") # Mensaje de éxito en consola
            return True
        except Exception as e:
            print(f"Error al desactivar usuario: {e}")
   
    @classmethod
    def update_user_admin(cls, user_id, username=None, fk_rol=None, contrasena=None):
        db = Conexion()
        try:
            usuario_actual = cls.get_user_by_id(user_id)
            
            if not usuario_actual:
                print(f"Usuario {user_id} no encontrado")
                return False
            
            datos_actuales = cls.get_user_account(user_id)
            if not datos_actuales:
                return False
            
            update_fields = []
            params = []
       
            # Usar datos actuales si no se proporcionan nuevos
            if username is not None and username.strip():
                update_fields.append("Nombre = %s")
                params.append(username)
            
            if fk_rol is not None and fk_rol.strip():
                update_fields.append("fk_rol = %s")
                params.append(fk_rol)
        
            if contrasena is not None and contrasena.strip():
                update_fields.append("Contrasena = %s")
                params.append(contrasena)
            
            if not update_fields:
                print("DEBUG - No hay campos para actualizar")
                return True
            
            params.append(user_id)
            
            
            # Actualizar tbl_usuario
            sql_update_user = f"""
                    UPDATE tbl_usuario
                    SET {', '.join(update_fields)}
                    WHERE Id_usuario = %s;
                """
                
            db.execute_query(sql_update_user, tuple(params), commit=True)
            print(f"DEBUG - ✅ Usuario {user_id} actualizado exitosamente en BD")
            print(f"DEBUG - Consulta ejecutada: {sql_update_user}")
            print(f"DEBUG - Parámetros:{params}")
            return True

        except Exception as e:
            print(f"Error al actualizar usuario desde admin: {e}")
            return False


            