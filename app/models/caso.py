from app.db import Conexion
from app.models.utils import formatear_fecha

class Caso:
    def __init__(self, id_caso=None, fecha=None, descripcion=None, personas_afectadas=None, direccion=None,
                 fk_usuario=None, fk_desastre=None, fk_ciudad=None, fk_estado="01"):
        self.id_caso = id_caso
        self.fecha = fecha
        self.descripcion = descripcion
        self.direccion = direccion
        self.personas_afectadas = personas_afectadas
        self.fk_usuario = fk_usuario
        self.fk_desastre = fk_desastre
        self.fk_ciudad = fk_ciudad
        self.fk_estado = fk_estado

    # ======================== Métodos de Inserción ========================
    @classmethod
    def insert_case(cls, fecha, descripcion, direccion, personas_afectadas,
                    fk_usuario, fk_desastre, fk_ciudad, fk_estado="R"):
        """
        Inserta un nuevo caso usando el procedimiento sp_insert_case.
        Los parámetros deben coincidir con los del procedimiento.
        """
        db = Conexion()
        conn = db.get_connection()
        cursor = conn.cursor()
        try:
            cursor.callproc('sp_insert_case', (
                fecha, descripcion, direccion, personas_afectadas,
                fk_usuario, fk_desastre, fk_ciudad, fk_estado
            ))
            # El procedimiento devuelve el id del caso como un conjunto de resultados
            id_caso = None
            for result in cursor.stored_results():
                row = result.fetchone()
                if row:
                    id_caso = row[0]
                    break
            conn.commit()
            return id_caso
        except Exception as e:
            conn.rollback()
            print(f"Error al insertar caso: {e}")
            raise
        finally:
            cursor.close()
            conn.close()

    # ======================== Métodos de Consulta ========================
    @classmethod
    def get_case_by_id(cls, id_caso):
        """Obtiene un caso por su ID usando sp_get_case_by_id."""
        sql = "CALL sp_get_case_by_id(%s)"
        db = Conexion()
        row = db.execute_query(sql, (id_caso,), fetchone=True)
        if not row:
            return None

        fecha = row[1]
        fecha_formateada = formatear_fecha(fecha)

        return {
            "id": row[0],
            "fecha": fecha_formateada,
            "descripcion": row[2],
            "direccion": row[3],
            "personas_afectadas": row[4],
            "id_desastre": row[5],
            "desastre": row[6],
            "municipio": row[7],
            "estado": row[8],
            "prioridad": row[9]
        }

    @classmethod
    def get_cases_user(cls, fk_usuario):
        """Obtiene los casos de un usuario usando sp_get_cases_user."""
        sql = "CALL sp_get_cases_user(%s)"
        db = Conexion()
        rows = db.execute_query(sql, (fk_usuario,), fetchall=True)
        casos = []
        for row in rows:
            fecha = row[1]
            fecha_formateada = formatear_fecha(fecha)
            casos.append({
                "id": row[0],
                "fecha": fecha_formateada,
                "descripcion": row[2],
                "direccion": row[3],
                "personas_afectadas": row[4],
                "desastre": row[5],
                "municipio": row[6],
                "estado": row[7]
            })
        return casos

    
    @classmethod
    def get_cases_admin(cls):
        """Obtiene todos los casos (para admin) usando sp_get_cases_admin."""
        sql = "CALL sp_get_cases_admin()"
        db = Conexion()
        rows = db.execute_query(sql, fetchall=True)
        casos = []
        for row in rows:
            fecha = row[3]
            fecha_formateada = formatear_fecha(fecha)
            casos.append({
                "id": row[0],
                "usuario": row[1],
                "email" : row [2],
                "fecha": fecha_formateada,
                "desastre": row[4],
                "direccion": row[5],
                "municipio": row[6],
                "estado": row[7]
            })
        return casos

    @classmethod
    def generate_report(cls, initial_date, final_date):
        """Genera reporte de casos en un rango de fechas usando sp_generate_report."""
        sql = "CALL sp_generate_report(%s, %s)"
        db = Conexion()
        rows = db.execute_query(sql, (initial_date, final_date), fetchall=True)
        casos = []
        for row in rows:
            fecha_formateada = formatear_fecha(row[1])
            casos.append({
                "id": row[0],
                "fecha": fecha_formateada,
                "descripcion": row[2],
                "direccion": row[3],
                "personas_afectadas": row[4],
                "desastre": row[5],
                "municipio": row[6],
                "estado": row[7],
                "entidad_encargada": row[8],
                "id_usuario": row[9],
                "nombre_usuario": row[10],
                "nombre_completo": row[11]
            })
        return casos

    @classmethod
    def get_user_by_case(cls, caso_id):
        """Obtiene los datos del usuario asociado a un caso usando sp_get_user_by_case."""
        sql = "CALL sp_get_user_by_case(%s)"
        db = Conexion()
        row = db.execute_query(sql, (caso_id,), fetchone=True)
        if not row:
            return None
        return {
            "id_persona": row[0],
            "nombre_completo": row[1] or "Usuario no identificado",
            "email": row[2] or "",
            "num_contacto": row[3] or ""
        }

    # ======================== Métodos Estadísticos ========================
    # Estas funciones ya están definidas en la base de datos y deben ser llamadas desde aquí.

    @classmethod
    def total_casos_persona(cls, usuario_id):
        sql = "SELECT fn_total_casos_persona(%s)"
        db = Conexion()
        row = db.execute_query(sql, (usuario_id,), fetchone=True)
        return row[0] if row else 0
    
    @classmethod
    def total_casos_sistema(cls):
        sql = "SELECT fn_total_casos_sistema()"
        db = Conexion()
        row = db.execute_query(sql, fetchone=True)
        return row[0] if row else 0

    @classmethod
    def casos_enviados_persona(cls, usuario_id):
        sql = "SELECT fn_casos_enviados_persona(%s)"
        db = Conexion()
        row = db.execute_query(sql, (usuario_id,), fetchone=True)
        return row[0] if row else 0
    
    @classmethod
    def casos_enviados_sistema(cls):
        sql = "SELECT fn_casos_enviados_sistema()"
        db = Conexion()
        row = db.execute_query(sql, fetchone=True)
        return row[0] if row else 0
    
    @classmethod
    def casos_cerrados_persona(cls, usuario_id):
        sql = "SELECT fn_casos_cerrados_persona(%s)"
        db = Conexion()
        row = db.execute_query(sql, (usuario_id,), fetchone=True)
        return row[0] if row else 0
    
    @classmethod
    def casos_cerrados_sistema(cls):
        sql = "SELECT fn_casos_cerrados_sistema()"
        db = Conexion()
        row = db.execute_query(sql, fetchone=True)
        return row[0] if row else 0
    
    @classmethod
    def casos_incendio_usuario(cls, usuario_id):
        sql = "SELECT fn_casos_incendio_usuario(%s)"
        db = Conexion()
        row = db.execute_query(sql, (usuario_id,), fetchone=True)
        return row[0] if row else 0

    @classmethod
    def casos_incendio_sistema(cls):
        sql = "SELECT fn_casos_incendio_sistema()"
        db = Conexion()
        row = db.execute_query(sql, fetchone=True)
        return row[0] if row else 0
    
    @classmethod
    def casos_inundacion_usuario(cls, usuario_id):
        sql = "SELECT fn_casos_inundacion_usuario(%s)"
        db = Conexion()
        row = db.execute_query(sql, (usuario_id,), fetchone=True)
        return row[0] if row else 0
    
    @classmethod
    def casos_inundacion_sistema(cls):
        sql = "SELECT fn_casos_inundacion_sistema()"
        db = Conexion()
        row = db.execute_query(sql, fetchone=True)
        return row[0] if row else 0


    @classmethod
    def casos_sismo_usuario(cls, usuario_id):
        sql = "SELECT fn_casos_sismo_usuario(%s)"
        db = Conexion()
        row = db.execute_query(sql, (usuario_id,), fetchone=True)
        return row[0] if row else 0 
    
    @classmethod
    def casos_sismo_sistema(cls):
        sql = "SELECT fn_casos_sismo_sistema()"
        db = Conexion()
        row = db.execute_query(sql, fetchone=True)
        return row[0] if row else 0       
    
