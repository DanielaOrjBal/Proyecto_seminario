from app.db import Conexion
from app.models.usuario import Usuario
from app.models.utils import formatear_fecha

class Desastre:
    def __init__(self, id_desastre=None, Desastre=None, fk_prioridad=None, fk_entidad=None):
        self.id_desastre = id_desastre
        self.Desastre = Desastre
        self.fk_prioridad = fk_prioridad
        self.fk_entidad = fk_entidad
        
    # ======================== Métodos de Consulta generales ========================
    
    @classmethod
    def get_disasters(cls):
        try:
            sql= """ 
            SELECT
                d.Id_desastre,
                d.Desastre AS Desastre,
                p.Prioridad AS Prioridad,
                e.Id_entidad AS Id_entidad,
                e.Nombre_Entidad AS Nombre_Entidad,
                e.Descripcion AS Descripcion,
                a.Numero_Contacto AS Numero_Contacto,
                a.Correo AS Correo
            FROM tbl_desastre d
            INNER JOIN tbl_prioridad p ON d.fk_prioridad = p.Id_prioridad
            INNER JOIN tbl_entidad e ON d.fk_entidad = e.Id_entidad
            INNER JOIN tbl_adic_entidad a ON a.fk_entidad = e.Id_entidad
            ORDER BY p.Id_prioridad DESC;
            """
            db = Conexion()
            rows = db.execute_query(sql, fetchall=True)
            
            if not rows:
                print("No se encontró información de desastres")
                return []
            
            desastres = []
            for row in rows:
                desastre = {
                    "id_desastre": row[0],
                    "desastre": row[1],
                    "prioridad": row[2],
                    "id_entidad": row[3],
                    "nombre_entidad": row[4],
                    "descripcion": row[5],
                    "numero_contacto": row[6],
                    "correo": row[7]
                }
                desastres.append(desastre)
            
            return desastres 
        except Exception as e:
            print(f"Error al obtener desastres: {e}")
            return []
    
    @classmethod
    def get_entidad_by_desastre_id(cls, id_desastre):
        sql = """
        SELECT 
            e.Id_entidad,
            e.Nombre_Entidad AS Nombre_Entidad,
            a.Correo AS Correo
        FROM tbl_desastre d
        INNER JOIN tbl_entidad e ON d.fk_entidad = e.Id_entidad
        INNER JOIN tbl_adic_entidad a ON a.fk_entidad = e.Id_entidad
        WHERE d.Id_Desastre = %s;
        """
        db = Conexion()
        row = db.execute_query(sql, (id_desastre,), fetchone=True)
        if row:
            return {
                "id_entidad": row[0],
                "nombre_entidad": row[1],
                "correo": row[2]
            }
        return None
    
        