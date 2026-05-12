from app.db import Conexion
from app.models.ColaDesastres import ColaDesastres

class Desastre:
    def __init__(self, id_desastre=None, Desastre=None, fk_prioridad=None):
        self.id_desastre = id_desastre
        self.Desastre = Desastre
        self.fk_prioridad = fk_prioridad

    # ======================== Métodos de Consulta ========================
    @classmethod
    def get_disasters(cls):
        """Obtiene la lista de desastres usando la vista vw_desastres y retorna una ColaDesastres."""
        sql = "SELECT * FROM vw_desastres"
        db = Conexion()
        rows = db.execute_query(sql, fetchall=True)
        
        # Crear una nueva cola de desastres
        cola_desastres = ColaDesastres()
        
        if not rows:
            print("No se encontró información de desastres")
            return cola_desastres  # Retorna cola vacía
        
        for row in rows:
            desastre = {
                "id_desastre": row[0],
                "desastre": row[1],
                "prioridad": row[2],
                "nombre_entidad": row[3],
                "descripcion": row[4],
                "numero_contacto": row[5],
                "correo": row[6]
            }
            # Encolar cada desastre en la cola
            cola_desastres.encolar(desastre)
        
        return cola_desastres

    @classmethod
    def get_entidad_by_desastre_id(cls, id_desastre):
        """Obtiene la entidad responsable de un desastre usando sp_get_entidad_by_desastre."""
        sql = "CALL sp_get_entidad_by_desastre(%s)"
        db = Conexion()
        row = db.execute_query(sql, (id_desastre,), fetchone=True)
        if row:
            return {
                "id_entidad": row[0],
                "nombre_entidad": row[1],
                "correo": row[2]
            }
        return None    
        