# Proyecto_seminario
<img width="500" height="500" alt="logo_correo" src="https://github.com/user-attachments/assets/555e27aa-b547-4607-bc00-f6fc477f4381" />

*DESCRIPCIÓN* <br>
Primer repositorio público con el proyecto realizado para el seminario de computación en la nube.
Este proyecto es un aplicativo web que permite el registro y login de usuarios para que asimismo puedan registrar casos de desastres naturales y visualizar los detalles de los casos que ha registrado. Dicho aplicativo se realizó con el fin de brindar a las victimas de desastres naturales en el departamento de cundinamarca un sistema en el que puedan registarr detalles de su caso y que sean notificados a las autoridades correspondientes por parte de los administradores del aplicativo. Los administradores pueden visualizar los detalles de todos los casos y determinar de cuales se dará aviso vía email. 
El aplicativo está desarrollado en Python con el framework Flask, conectado a una base de datos en MySQL y con una interfaz grafica de usuario.

*FUNCIONAMIENTO* <br>
Al ingresar en el aplicativo web se muestra un *home* básico con un menú superior que contiene botones para el login, registro e idiomas. Los últimos tres botones permiten cambiar el idioma al que el usuario desee en todo el aplicativo.
<img width="950" height="445" alt="image" src="https://github.com/user-attachments/assets/93bda652-5411-4ae4-a350-0b7434c35892" />

En el login permitirá ingresar con usuario y contraseña validando su existencia en la base de datos y verificando su rol de forma que si es usuario lo redirija al dashboard de user y si es administrador lo redirija al dashboard de admin. 
Cada dashboard o perfil tiene funcionalidades distintas, en el user solo le es permitido manejar los datos propios de su cuenta,registrar casos a su nombre y visualizar los propios en una tabla que le permita conocer detalles como el estado de su caso y los datos enviados a la autoridad competente. En cuanto al perfil de administrador puede registar casos asignandolos para cualquiera de los usuarios que se encuentre registrado y activo en la base de datos; asimismo puede visualizar todos los casos que han sido registrados y decidir cuál debe ser notificado a las autoridades con el fin de tener un control sobre los datos enviados. 
<img width="959" height="448" alt="image" src="https://github.com/user-attachments/assets/e274ecba-b51b-43a1-abe0-40c9d1ed1db5" />

<img width="1917" height="892" alt="image" src="https://github.com/user-attachments/assets/55efa90a-fc3a-4adc-b2c7-2b877ff1a99d" />

A diferencia del usuario, el administrador puede generar reportes acerca de los casos registrados en el sistema creando un archivo en excel y permitiendo que se almacenen en el equipo. Igualmente gestiona a los usuarios del sistema eliminandolos, cambiando su rol o nombre de usuario si así lo desean. 
<img width="1911" height="895" alt="image" src="https://github.com/user-attachments/assets/a5919dca-e743-4aaa-a296-7a6e6763e733" />

*HERRAMIENTAS*<br>
Python
Flask
MySQL
HTML-CSS
Bootstrap
JavaScript




