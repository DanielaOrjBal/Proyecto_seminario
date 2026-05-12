from app.models.NodoCaso import NodoCaso

class ColaCasos:
    def __init__(self):
        self.primero = None
        self.ultimo = None

    def encolar(self, caso):
        """Agrega un caso al final de la cola."""
        nuevo = NodoCaso(caso)
        if self.primero is None:
            self.primero = nuevo
            self.ultimo = nuevo
        else:
            self.ultimo.siguiente = nuevo
            self.ultimo = nuevo

    def desencolar(self):
        """Elimina y retorna el primer caso de la cola."""
        if self.primero is None:
            return None
        caso = self.primero.caso
        self.primero = self.primero.siguiente
        if self.primero is None:
            self.ultimo = None
        return caso

    def mostrar(self):
        """Muestra todos los casos de la cola."""
        aux = self.primero
        while aux is not None:
            print(aux.caso)
            aux = aux.siguiente

    def a_lista(self):
        """Convierte la cola completa a una lista Python."""
        resultado = []
        aux = self.primero
        while aux is not None:
            resultado.append(aux.caso)
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
    
    def obtener_primero(self):
        """Retorna el primer caso sin eliminarlo."""
        if self.primero is None:
            return None
        return self.primero.caso
    
    def obtener_ultimo(self):
        """Retorna el último caso sin eliminarlo."""
        if self.ultimo is None:
            return None
        return self.ultimo.caso