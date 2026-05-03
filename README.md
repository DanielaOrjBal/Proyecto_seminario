<div class="row w-100">
  <div class="col-md-6">
    <h1>Proyecto Vitaria SOS</h1>
  </div>
  <div class="col-md-4">
    <img width="10%" height="auto" alt="logo_correo" src="https://github.com/user-attachments/assets/555e27aa-b547-4607-bc00-f6fc477f4381" />
  </div>
</div>
<h3 class="text">DESCRIPCIÓN</h3>
Este proyecto es un aplicativo web que permite el registro y login de usuarios para que asimismo puedan registrar casos de desastres naturales y visualizar los detalles de los casos que ha registrado. Dicho aplicativo se realizó con el fin de brindar a las victimas de desastres naturales en el departamento de cundinamarca un sistema en el que puedan registarr detalles de su caso y que sean notificados a las autoridades correspondientes por parte de los administradores del aplicativo. Los administradores pueden gestionar todos los casos y determinar de cuales se dará aviso a las autoridades vía email, de igual forma pueden gestionar a los usuarios registrados en el aplicativo realizando acciones como edición de datos, desactivación de usuario y cambio de rol.
El aplicativo está desarrollado en Python con el framework Flask, librerías como bcrypt para el cifrado de datos, JWT para manejo de sesiones, Flask-Mail para el manejo de correos,conexión a una base de datos en MySQL y una GUI desarrollada en HTML, JS, CSS y Bootstrap.

<h3 class="text">FUNCIONAMIENTO</h3>
<p>Al ingresar en el aplicativo web se muestra un *home* básico con un menú superior que contiene botones para el login y registro de los usuarios.</p>
<img width="500" height="auto" alt="image" src="https://github.com/user-attachments/assets/64fdd8c0-f4bc-44c7-a9bb-416377c15a04" />
<p>En el login permitirá ingresar con usuario y contraseña validando su existencia en la base de datos y verificando su rol de forma que si es usuario lo redirija al dashboard de user y si es administrador lo redirija al dashboard de admin. Al ser dirigidos se les asigna un token único por sesión que tiene una duración de 15 minutos, pasado ese tiempo el usuario es redirigido al login y el token deja de funcionar.</p>
<img width="1919" height="899" alt="image" src="https://github.com/user-attachments/assets/340d240a-0ff9-44b2-b381-1d16b0086a64" />

<p>Cada dashboard o perfil tiene funcionalidades distintas, en el user solo le es permitido manejar los datos propios de su cuenta,registrar casos a su nombre y visualizar los propios en una tabla que le permita conocer detalles como el estado de su caso. En cuanto al perfil de administrador permite visualizar todos los casos que han sido registrados en el sistema con información basica del usuario que lo reportó y gestionarlos al cambiar su estado o enviandolos a la entidad correspondiente.</p>
<h6>Panel usuario</h6>
<img width="1919" height="905" alt="image" src="https://github.com/user-attachments/assets/9e6ba26f-0910-43a6-8525-647a945e1b02" />
<hr>

<h6>Panel administrador</h6>
<img width="1919" height="895" alt="image" src="https://github.com/user-attachments/assets/56e56bf6-7cd8-49dc-af73-06c01d17bc72"  />

<hr>
<h6>Gestion de usuario en panel de administrador</h6>
<img width="1915" height="955" alt="image" src="https://github.com/user-attachments/assets/c13e29ca-79d1-4ad4-8a8b-ff2c2f060368" />
<hr>
<br>
<p>Además de ello el perfil de administrador puede generar reportes acerca de los casos registrados en el sistema entre dos fechas especificas (una fecha inicial y una fecha final), creando un archivo en excel y permitiendo que se almacenen en el equipo.</p>
<img width="1919" height="882" alt="image" src="https://github.com/user-attachments/assets/24a8ea10-3a23-4236-b06b-2bb96154d709" />
<br>
<p>El sistema general cuenta con una función que almacena todas las acciones realizadas tanto por usuarios como por administradores en un historico para tener un sistema de auditoria básico.</p>

<h6>Historico</h6>
<img width="500" height="auto" alt="image" src="https://github.com/user-attachments/assets/2c5cfbe8-a241-4e58-b32c-0a26f65856b6" />



*DESCARGA*<br>
Para que hacer uso del sistema y personalizarlo deben seguir las instrucciones a contiuación:
1. Clonar el repositorio
2. Crear el entorno virtual (al mismo nivel de la carpeta app)
<img width="200" height="auto" alt="image" src="https://github.com/user-attachments/assets/4c439cd9-8195-44c2-b90f-d47d7f1ced41" />
3. Instalar las dependencias necesarias (pip install -r app/requirements.txt)
4. Modificar la conexión a la base de datos con los datos de la base local
5. Modificar archivo .env con lo valores del correo a enlazar (correo desde donde serán enviados)
6. Correr el proyecto con python run.py (estar en la carpeta raiz)
*Recuerda tener ya la base de datos montada en workbench*





