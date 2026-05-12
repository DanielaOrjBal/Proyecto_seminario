from app.models.NodoDesastre import NodoDesastre

class ColaDesastres:
    def __init__(self):
        self.primero = None
        self.ultimo = None

    def encolar(self, desastre):
        nuevo = NodoDesastre(desastre)
        if self.primero is None:
            self.primero = nuevo
            self.ultimo = nuevo
        else:
            self.ultimo.siguiente = nuevo
            self.ultimo = nuevo

    def desencolar(self):
        if self.primero is None:
            return None
        desastre = self.primero.desastre
        self.primero = self.primero.siguiente
        if self.primero is None:
            self.ultimo = None
        return desastre

    def mostrar(self):
        aux = self.primero
        while aux is not None:
            print(aux.desastre)
            aux = aux.siguiente

    def a_lista(self):
        """Convierte la cola completa a una lista Python."""
        resultado = []
        aux = self.primero
        while aux is not None:
            resultado.append(aux.desastre)
            aux = aux.siguiente
        return resultado
    
    def esta_vacia(self):
        """Verifica si la cola está vacía."""
        return self.primero is None
    
    def tamanio(self):
        """Retorna el número de elementos en la cola."""
        contador = 0
        aux = self.primero
        while aux is not None:
            contador += 1
            aux = aux.siguiente
        return contador