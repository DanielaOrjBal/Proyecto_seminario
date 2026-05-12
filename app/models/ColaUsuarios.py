from app.models.NodoUsuario import NodoUsuario

class ColaUsuarios:
    def __init__(self):
        self.primero = None
        self.ultimo = None

    def encolar(self, usuario):
        nuevo = NodoUsuario(usuario)
        if self.primero is None:
            self.primero = nuevo
            self.ultimo = nuevo
        else:
            self.ultimo.siguiente = nuevo
            self.ultimo = nuevo

    def desencolar(self):
        if self.primero is None:
            return None
        usuario = self.primero.usuario
        self.primero = self.primero.siguiente
        if self.primero is None:
            self.ultimo = None
        return usuario

    def mostrar(self):
        aux = self.primero
        while aux is not None:
            print(aux.usuario)
            aux = aux.siguiente

    def a_lista(self):
        """Convierte la cola completa a una lista Python."""
        resultado = []
        aux = self.primero
        while aux is not None:
            resultado.append(aux.usuario)
            aux = aux.siguiente
        return resultado