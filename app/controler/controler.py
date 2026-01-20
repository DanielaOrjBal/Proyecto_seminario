from flask import request, redirect, url_for, render_template,session,jsonify, send_file
from flask_mail import Message
from app.models.utils import enviar_correo_registro, enviar_correo_caso, enviar_correo_actualizacion_datos, enviar_correo_actualizacion_datos_admin, enviar_correo_recuperacion, generar_contrasena_temporal, enviar_correo_caso_entidad
from urllib.parse import quote
from app.models.usuario import Usuario
from app.models.caso import Caso
from app.models.desastre import Desastre
from app.models.utils import validar_fecha, validar_edad, validar_caracteres_consecutivos, validar_número_documento
import re, os
import time
from datetime import datetime
import pandas as pd
from io import BytesIO


class Login:
    def __init__(self):
        pass
    
    #Funcion para login de usuario 
    def login(self):
        # Manejo de datos del formulario
        if request.method == 'POST':
            username = request.form.get('username')
            password = request.form.get('password')
            
            
            user = Usuario.get_user_by_name(username)
            print(f"Usuario: {user is not None}, Contraseña ingresada: {password}")
            
            # Validar existencia de usuario en la base de datos
            if not user:
                return jsonify({"status":"error", "msg": "Nombre de usuario no encontrado. Verifique nombre de usuario ingresado.❌"}), 400

            # Validar contraseña del usuario
            if user.password != password:
                print(f"Contraseña incorrecta para {username}")
                return jsonify({"status":"error", "msg": "Credenciales incorrectas. Inténtelo de nuevo.❌"}), 400

            
            # Validar estado del usuario
            if user.estado == "00":  # 01 activo, 00 Inactivo
                print(f"Usuario {username} inactivo")
                return jsonify({"status":"warning", "msg": "Usuario inactivo. Contacte al administrador.⚠"}), 400
            
            # GUardar datos en sesión
            session['username'] = user.username
            
            # Obtener el rol del usuario 
            if user.rol == 'Admin':
                return jsonify({
                    "status":"success", 
                    "msg": "Login exitoso para administrador ✅",
                    "redirect":"/admin/dashboard"}), 200
            else:
                return jsonify({
                    "status":"success", 
                    "msg": "Login exitoso para usuario ✅",
                    "redirect" : "/user/dashboard"}), 200

        # Mostrar la plantilla de login en caso de no pasar las validaciones
        return render_template('login.html')
    
    #Funcion para logout de usuario
    def logout(self):
        # Limpiar los datos guardados en la sesión
        session.pop('user_id', None)
        session.pop('username', None)
        session.pop('rol', None)
        msg = quote("Sesión cerrada exitosamente ✅") 
        return redirect(url_for('auth.login', status="success", msg=msg)) # Redirigir a la página de login

class Registro:
    def __init__(self):
        pass
    
    #Funcion para registro de usuario
    def registro(self):
        if request.method == 'POST':
            print("Datos recibidos del formulario:", request.form.to_dict())
            
            # Obtener datos del formulario
            username = request.form.get("username", "")
            password = request.form.get("password", "")
            id_persona = request.form.get("documento", "")
            primer_nombre = request.form.get("primer_nombre", "")
            segundo_nombre = request.form.get("segundo_nombre", "")
            primer_apellido = request.form.get("primer_apellido", "")
            segundo_apellido = request.form.get("segundo_apellido", "")
            tipo_doc = request.form.get("tipo_documento", "")
            fecha_nac = request.form.get("fecha_nacimiento", "")
            direccion = request.form.get("direccion", "")
            num_contacto = request.form.get("telefono", "")
            email = request.form.get("email", "")
            
            errores = {}
            edad_calculada = None
            
        #VALIDACIONES ANTES DE REGISTRAR
            
            # Validacion de todos los campos obligatorios
            campos_obligatorios = {
                    "username": username,
                    "password": password,
                    "documento": id_persona,
                    "primer_nombre": primer_nombre,
                    "primer_apellido": primer_apellido,
                    "tipo_documento": tipo_doc,
                    "fecha_nacimiento": fecha_nac,
                    "direccion": direccion,
                    "telefono": num_contacto,
                    "email": email
                }
            
            for campo, valor in campos_obligatorios.items():
                if not valor:
                    errores[campo] = "Este campo es obligatorio"
            
            if not errores:
        
                #VALIDACIONES DOCUMENTO
                # Validacion de tipo de documento seleccionado
                documento = ["CC", "TI", "CE", "PA"]
                if tipo_doc not in documento:
                    errores["tipo_documento"] = "Seleccione una opción correcta para el tipo de documento"
                
                if not id_persona.isdigit() or len(id_persona) < 6:
                    errores["documento"] = "El número de documento debe tener mínimo 6 dígitos"
                    
                elif not validar_número_documento(id_persona.strip()):
                    errores["documento"] = "No puede contener 6 o más números consecutivos iguales"
                
                # Validacion de usuario existente por documento
                elif Usuario.documento_exists(id_persona):
                    errores["documento"] = "El documento ya está registrado"
                
                #VALIDACIONES NOMBRES - APELLIDOS
                # Validacion de nombres con letras y espacios
                patron_nombres = r'^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]{4,}$'
                if not re.fullmatch(patron_nombres, primer_nombre.strip()):
                    errores["primer_nombre"] = "Debe contener solo letras y espacios, con mínimo 4 caracteres"
                    
                if not validar_caracteres_consecutivos(primer_nombre.strip()):
                    errores["primer_nombre"] = "No puede tener 4 o más letras iguales consecutivas"
                
                if segundo_nombre and segundo_nombre.strip():
                    if not re.fullmatch(patron_nombres, segundo_nombre.strip()):
                        errores["segundo_nombre"] = "Debe contener solo letras y espacios, con mínimo 4 caracteres"
                        
                    elif len(segundo_nombre.strip()) < 4:
                        errores["segundo_nombre"] = "Debe tener mínimo 4 caracteres"
                        
                    elif not validar_caracteres_consecutivos(segundo_nombre.strip()):
                        errores["segundo_nombre"] = "No puede tener 4 o más letras iguales consecutivas"
                    
                # Validacion de apellidos con letras y espacios
                if not re.fullmatch(patron_nombres, primer_apellido.strip()):
                    errores["primer_apellido"] = "Debe contener solo letras y espacios, con mínimo 4 caracteres"
                    
                elif not validar_caracteres_consecutivos(primer_apellido.strip()):
                    errores["primer_apellido"] = "No puede tener 4 o más letras iguales consecutivas"
                
                if segundo_apellido and segundo_apellido.strip():
                    if not re.fullmatch(patron_nombres, segundo_apellido.strip()):
                        errores["segundo_apellido"] = "Debe contener solo letras y espacios, con mínimo 4 caracteres"
                    elif not validar_caracteres_consecutivos(segundo_apellido.strip()):
                        errores["segundo_apellido"] = "No puede tener 4 o más letras iguales consecutivas"

                #VALIDACIONES EDAD
                # Validacion de edad
                try:
                    edad_calculada = validar_edad (fecha_nac)
                    
                    if edad_calculada is None:
                        errores["fecha_nacimiento"] = "La fecha de nacimiento no es válida"
                    
                    if edad_calculada < 18:
                        errores["fecha_nacimiento"] = "Debe ser mayor de 18 años para registrarse"
                    
                    if edad_calculada > 90:
                        errores["fecha_nacimiento"] = "La edad debe estar entre 18 y 90 años" 
                        
                except ValueError:
                    errores["fecha_nacimiento"] = "Error al validar la edad"
                
                #VALIDACIONES DIRECCIÓN 
                # Validacion de dirección alfanumerica y con longitud mínima
                direccion_limpia = direccion.strip()
                if len(direccion_limpia) < 10:
                    errores["direccion"] = "La dirección debe tener un mínimo de 10 caracteres"
                
                patron_direccion = r'^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s#\-.,]+$'
                if not re.fullmatch(patron_direccion, direccion_limpia):
                    errores["direccion"] = "Solo puede contener letras, números, espacios y los caracteres # - . ,"
            
                #VALIDACIONES TELEFONO
                # Validacion en numero de telefono
                if not num_contacto.isdigit() or len(num_contacto) != 10:
                    errores["telefono"] = "El número de teléfono debe tener 10 dígitos"
            
                #VALIDACIONES EMAIL
                # Validacion de email existente y dominio válido
                if Usuario.email_exist(email):
                    errores["email"] = "El correo ya está registrado"
                
                patron_email = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|co)$'
                if not re.fullmatch(patron_email, email.lower()):
                    errores["email"] = "Debe tener un dominio válido (.com o .co)"
            
                #VALIDACIONES USUARIO
                # Validacion para usuario existente y condiciones
                if Usuario.username_exists(username):
                    errores["username"] = "El nombre de usuario ya existe.Elige otro."
                
                if len(username) < 4 or len(username) > 10:
                    errores["username"] = "El nombre de usuario debe tener entre 4 y 10 caracteres"
                
                #VALIDACIONES CONTRASEÑA
                # Validacion de contraseña con condiciones
                patron_password = r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.,;:\-_])[A-Za-z\d@$!%*?&.,;:\-_]{8,}$'
                if not re.fullmatch(patron_password, password):
                    errores["password"] = "Debe tener mínimo 8 caracteres, una mayúscula, un número y un caracter especial"
                    
            if errores:
                return jsonify({
                    "status": "error",
                    "msg": "Por favor corrige los errores en el formulario",
                    "errores": errores
                }),400
                
            # REGISTRO DE USUARIO DESPUES DE VALIDACIONES
            try:
                Usuario.insert_user_with_details(
                    username, password,
                    id_persona, primer_nombre, segundo_nombre,
                    primer_apellido, segundo_apellido, tipo_doc, fecha_nac,
                    edad_calculada, direccion, num_contacto, email
                )
                
                enviar_correo_registro(primer_nombre, primer_apellido,email,username)
                
                session['username'] = username
                
                return jsonify({
                    "status":"success", 
                    "msg": "Usuario registrado correctamente ✅",
                    }), 200
                
            except Exception as e:
                print("Error al ingresar el usuario", e)
                return jsonify({"status":"error", "msg": "Error al registrar usuario, inténtelo nuevamente ❌"}), 500
            
        return render_template('register.html')

    # Funcion para registro de casos usuario
    def registrar_caso_usuario(self):
        # Manejo de datos del formulario
        if request.method == "POST":
            fecha = request.form ["fecha"]
            descripcion = request.form["descripcion"]
            direccion = request.form["direccion"]
            personas_afectadas = request.form["personas_afectadas"]
            fk_desastre= request.form["tipo_desastre"]
            fk_ciudad = request.form["ciudad"]
            radicado = None  
            
            #  Detectar si es admin o usuario
            if "fk_usuario" in request.form:  # caso del admin
                fk_usuario = request.form["fk_usuario"]
            else:  # caso del usuario autenticado
                fk_usuario = Usuario.get_user_by_session()
            
            # VALIDACIONES ANTES DE REGISTRAR
            
            # Validacion de todos los campos obligatorios
            campos_obligatorios = [fecha, descripcion, direccion, personas_afectadas, fk_desastre, fk_ciudad]
            
            if not all(campos_obligatorios):
                return jsonify({"status":"warning", "msg": "Por favor, complete todos los campos obligatorios.⚠"}), 400
            # Validacion de personas afectadas
            if not personas_afectadas.isdigit() or int(personas_afectadas) < 1 or int(personas_afectadas) > 25:
                return jsonify({"status":"warning", "msg": "El número de personas afectadas deben ser del núcleo familiar,no superior a 25 personas.⚠"}), 400
            
            # Validacion de ciudad ingresada
            if not fk_ciudad or not fk_ciudad.strip():
                return jsonify({"status":"warning", "msg": "Debe seleccionar una ciudad válida.⚠"}), 400
            
            resultado_validacion_fecha = validar_fecha(fecha)
            if resultado_validacion_fecha is not None:
                return jsonify({"status":"warning", "msg": resultado_validacion_fecha}),400
            
            # REGISTRO DE CASO DESPUES DE VALIDACIONES
            try:
                id_caso = Caso.insert_case(fecha, descripcion, direccion, personas_afectadas,fk_usuario, fk_desastre,fk_ciudad,radicado)
                
                usuario = Usuario.get_user_account(fk_usuario)
                caso= Caso.get_case_by_id(id_caso)
                
                if not usuario:
                    raise Exception("No se encontró información del usuario")
                
                if not caso:
                    raise Exception("No se encontró el caso recién registrado.")
                
                email = usuario["email"]
                nombre = usuario["nombres"]
                apellido = usuario["apellidos"]
                desastre = caso["desastre"]
                
                enviar_correo_caso(fecha,descripcion,personas_afectadas,email,nombre,apellido,desastre)
                
                return jsonify({"status":"success", "msg": "Caso registrado correctamente ✅"}), 200
            
            except Exception as e:
                print("Error al ingresar el caso", e)
                return jsonify({"status":"error", "msg": "Error al registrar caso, inténtelo nuevamente ❌"}), 500

class Consulta:
    def __init__(self):
        pass
    # Funcion para consultar casos de usuario
    def buscar_caso_usuario(self):
        try:
            # Obtener el id del usuario desde la sesión para buscar sus casos
            fk_usuario = Usuario.get_user_by_session()
            if not fk_usuario:
                raise ValueError("No hay usuario en sesión o no existe en la base de datos.")
            
            # Obtener los casos asociados al usuario
            casos = Caso.get_cases_user(fk_usuario)
            if not casos:
                raise ValueError("No se encontraron casos para este usuario.")
            return casos
        
        #manejo de errores
        except Exception as e:
            print(f"Error al consultar casos: {e}")
            return []
            
    def buscar_casos_admin(self):
        try:
            # Obtener los casos asociados al usuario
            casos = Caso.get_cases_admin()
            if not casos:
                raise ValueError("No se encontraron casos registrados.")
            return casos
        
        #manejo de errores
        except Exception as e:
            print(f"Error al consultar casos admin: {e}")
            return []
    # Funcion para ver datos de usuario           
    def ver_datos_usuario(self):
        try:
            #  Obtener el nombre de usuario desde la sesión
            username = session.get("username")
            if not username:
                raise ValueError("No hay usuario en sesión.")

            # Obtener el id del usuario desde la sesión
            fk_usuario = Usuario.get_user_by_session()
            if not fk_usuario:
                raise ValueError("El usuario no existe en la base de datos.")

            # Obtener los datos del usuario desde la base de datos
            usuario = Usuario.get_user_account(fk_usuario)
            
            # Validar que se hayan obtenido datos del usuario
            if not usuario:
                raise ValueError("No se encontraron datos para este usuario.") 

            # Enmascarar la contraseña para mostrarla parcialmente al usuario
            raw_password = usuario["contrasena"] or ""
            visible_part = raw_password[-2:] 
            masked ="••" * (len(raw_password) - 2) + visible_part 
            usuario["contrasena_masked"] = masked
            
            print("Datos del usuario obtenidos:", usuario)
            return jsonify(usuario) # Devolver los datos del usuario en formato JSON
        
        except Exception as e:
            print(f"Error al obtener datos del usuario: {e}")
            return jsonify({"error": f"Error al obtener datos del usuario: {str(e)}"}), 500
    
    def ver_data_usuario_admin(self,user_id):
        try:
            usuario = Usuario.get_user_account(user_id)
            if usuario:
                print(f"DEBUG - Enviando datos usuario: id={usuario['id_usuario']}, nombre={usuario['nombre_usuario']}, rol={usuario['rol_usuario']}, contraseña={usuario["contrasena"]}")
                return jsonify(usuario)
            else:
                print(f"DEBUG - Usuario {user_id} no encontrado")
                return jsonify({"status": "error", "msg": "Usuario no encontrado"}), 404
        except Exception as e:
            print(f"DEBUG - Error en ver_data_usuario_admin: {e}")
            return jsonify({"status": "error", "msg": "Error al obtener datos del usuario"}), 500
        
    def obtener_usuarios(self):
        usuarios = Usuario.get_all_users()
        usuarios_json = [{"id": u[0], "nombre": u[1]} for u in usuarios]
        print("Resultado de usuarios:", usuarios)
        return jsonify(usuarios_json)

    def gestionar_usuarios(self):
        try: 
            usuarios = Usuario.get_data_all_users()
            if not usuarios:
                raise ValueError("No se encontraron usuarios registrados")
            return usuarios
        
        except Exception as e:
            print(f"Error al encontrar usuarios: {e}")
            return []
    
    def buscar_desastres(self):
        try: 
            desastres = Desastre.get_disasters()
            if not desastres:
                raise ValueError("No se encontró la información de los desastres")
            return desastres
        
        except Exception as e:
            print(f"Error al encontrar información de desastres: {e}")
            return []
        
    def generar_reporte(self):
        
        initial_date = request.form.get("FechaInicial")
        final_date = request.form.get("FechaFinal")
        print("Fechas recibidas:", initial_date, final_date) 
        
        if not initial_date or not final_date:
            return jsonify({"status":"warning", "msg": "Faltan datos en el formulario. ⚠"}), 400
        if initial_date > final_date:
            return jsonify({"status":"warning", "msg": "La fecha inicial no puede ser mayor a la fecha final. ⚠"}), 400
        
        error_inicial = validar_fecha(initial_date)
        error_final = validar_fecha(final_date)
        
        if error_inicial is not None:
            return jsonify({"status":"warning", "msg": f"Fecha inicial inválida: {error_inicial} ⚠"}), 400
        if error_final is not None:
            return jsonify({"status":"warning", "msg": f"Fecha final inválida: {error_final} ⚠"}), 400
        
        fecha_ini = datetime.strptime(initial_date, "%Y-%m-%d").date()
        fecha_fin = datetime.strptime(final_date, "%Y-%m-%d").date()
        
        if fecha_ini > fecha_fin:
            return jsonify({"status": "warning", "msg": "La fecha inicial no puede ser mayor a la fecha final. ⚠"}), 400
        
        try:
            reporte = Caso.generate_report(initial_date, final_date)
            
            fecha_actual = datetime.now().strftime("%Y%m%d_%H%M%S")
            filename = f"Reporte_Casos_{fecha_actual}.xlsx"
            
            if not reporte:
                df = pd.DataFrame([{"Mensaje": "No se encontraron datos para las fechas seleccionadas."}])
            else:
                df = pd.json_normalize(reporte)
            
            output = BytesIO()
            df.to_excel(output, index=False, engine='openpyxl')
            output.seek(0)
            
            return send_file(
            output,
            as_attachment=True,
            download_name=filename,
            mimetype="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        )
        except Exception as e:
            print(f"Error al generar el reporte:{e}")
            return jsonify({"status": "error", "msg": "Error al generar el reporte ❌"}), 500
    
class Actualizar:
    def __init__(self):
        pass
    
    # Funcion para actualizar datos de usuario
    def actualizar_datos_usuario(self):    
        try:
            # Obtener el id del usuario desde la sesión
            fk_usuario = Usuario.get_user_by_session()
            if not fk_usuario:
                raise ValueError("Usuario no encontrado en sesión.")

            # Obtener los datos del formulario
            pri_nom = (request.form.get("pri_nom") or "").strip() or None
            seg_nom = (request.form.get("seg_nom") or "").strip() or None
            pri_ape = (request.form.get("pri_ape") or "").strip() or None
            seg_ape = (request.form.get("seg_ape") or "").strip() or None
            direccion = (request.form.get("direccion_user") or "").strip() or None
            email = (request.form.get("email") or "").strip() or None
            telefono = (request.form.get("telefono") or "").strip() or None
            edad_str = (request.form.get("edad") or "").strip()
            edad = int(edad_str) if edad_str else None  
            username = (request.form.get("username") or "").strip() or None
            
            # VALIDACIONES DE DATOS ANTES DE ACTUALIZAR
            # Validar que haya al menos un campo para actualizar
            if not any([pri_nom, seg_nom,pri_ape,seg_ape, direccion, email,telefono, edad, username]):
                return jsonify({"status":"warning", "msg": "Debe proporcionar al menos un campo para actualizar. ⚠"}), 400
            
            
            #VALIDACIONES NOMBRES - APELLIDOS
            # Validacion de nombres con letras y espacios
            patron_nombres = r'^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]{4,}$'
            if pri_nom is not None:
                if not re.fullmatch(patron_nombres, pri_nom.strip()):
                    return jsonify({"status":"warning", "msg": "El primer nombre debe contener solo letras y espacios, con mínimo 4 caracteres. ⚠"}), 400
                        
                if not validar_caracteres_consecutivos(pri_nom.strip()):
                    return jsonify({"status":"warning", "msg": "El primer nombre no puede tener 4 o más letras iguales consecutivas. ⚠"}), 400
                    
            if seg_nom is not None:
                if not re.fullmatch(patron_nombres, seg_nom.strip()):
                    return jsonify({"status":"warning", "msg": "El segundo nombre debe contener solo letras y espacios, con mínimo 4 caracteres. ⚠"}), 400
                        
                elif len(seg_nom.strip()) < 4:
                    return jsonify({"status":"warning", "msg": "El segundo nombre debe tener mínimo 4 caracteres. ⚠"}), 400
                        
                elif not validar_caracteres_consecutivos(seg_nom.strip()):
                    return jsonify({"status":"warning", "msg": "El segundo nombre no puede tener 4 o más letras iguales consecutivas. ⚠"}), 400
                    
            # Validacion de apellidos con letras y espacios
            if pri_ape is not None:
                if not re.fullmatch(patron_nombres, pri_ape.strip()):
                        return jsonify({"status":"warning", "msg": "El primer apellido debe contener solo letras y espacios, con mínimo 4 caracteres. ⚠"}), 400
                        
                elif not validar_caracteres_consecutivos(pri_ape.strip()):
                        return jsonify({"status":"warning", "msg": "El primer apellido no puede tener 4 o más letras iguales consecutivas. ⚠"}), 400
            
            if seg_ape is not None:
                if seg_ape and seg_ape.strip():
                    if not re.fullmatch(patron_nombres, seg_ape.strip()):
                        return jsonify({"status":"warning", "msg": "El segundo apellido debe contener solo letras y espacios, con mínimo 4 caracteres. ⚠"}), 400
                    elif not validar_caracteres_consecutivos(seg_ape.strip()):
                        return jsonify({"status":"warning", "msg": "El segundo apellido no puede tener 4 o más letras iguales consecutivas. ⚠"}), 400
                            
            # Validar dirección
            if direccion is not None: 
                direccion_limpia = direccion.strip()
                if len(direccion_limpia) < 10:
                    return jsonify({"status":"error", "msg": "La dirección debe tener un mínimo de 10 caracteres. ❌ "}), 400
                
                patron_direccion = r'^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s#\-.,]+$'
                if not re.fullmatch(patron_direccion, direccion_limpia):
                    return jsonify({"status":"error", "msg": "La dirección solo puede contener letras, números, espacios y los caracteres # - . ,. ❌ "}), 400

            #validar si el nombre de usuario ya existe
            if username is not None:
                if Usuario.username_exists(username):
                    return jsonify({"status":"error", "msg": "El nombre de usuario ya existe. Por favor, elige otro. ❌ "}), 400
                # Validar la longitud del nombre de usuario
                if len(username) < 4 or len(username) > 10:
                    return jsonify({"status":"warning", "msg": "El nombre de usuario debe tener entre 4 y 10 caracteres. ⚠"}), 400
            
            # Validar que el email no exista y tenga dominio 
            if email is not None:
                if Usuario.email_exist(email):
                        return jsonify({"status":"error", "msg": "El email ingresado ya existe. ❌ "}), 400
                    
                patron_email = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|co)$'
                if not re.fullmatch(patron_email, email.lower()):
                        return jsonify({"status":"error", "msg": "El email debe tener un dominio válido (.com o .co). ❌ "}), 400
                    
            # Validacion de edad si fue proporcionada
            if edad is not None:  # edad ya es int aquí
                if edad < 18 or edad > 90:
                    return jsonify({"status":"warning", "msg": "La edad debe estar entre 18 y 90 años.  ⚠"}), 400
            
            # Validacion de telefono si fue proporcionado
            if telefono is not None:
                if not telefono.isdigit() or len(telefono) < 7 or len(telefono) > 13:
                    return jsonify({"status":"warning", "msg": "El número de teléfono debe ser válido y tener todos los dígitos. ⚠"}), 400
                  
            
            # Actualizar los datos del usuario en la base de datos
            actualizar= Usuario.update_user_account(fk_usuario, pri_nom, seg_nom, pri_ape, seg_ape, direccion, email, telefono, edad, username)
                        
            # Manejo de errores en la actualización
            if not actualizar:
                raise ValueError("No se pudo actualizar los datos del usuario.")
            print("Datos del usuario actualizados:", actualizar)
            
            #Actualizar nombre de usuario en sesión si fue modificado
            if username:
                session['username'] = username
                print("Nombre de usuario en sesión actualizado a:", username)
                
            usuario = Usuario.get_user_account(fk_usuario)
            
            if not usuario:
                raise Exception("No se encontró información del usuario")
            
            nombre = usuario["nombres"]
            apellido = usuario["apellidos"]
            correo = usuario["email"]
            direccion = usuario["direccion"]
            telefono = usuario["telefono"]
            edad = usuario["edad"] 
            username = usuario["nombre_usuario"]
            
            enviar_correo_actualizacion_datos(nombre, apellido, direccion, correo,telefono, edad, username)
            
            # Mensaje de éxito
            return jsonify({"status":"success", "msg": "Datos actualizados correctamente ✅"}), 200
        
        except Exception as e:
            print(f"Error al actualizar los datos del usuario: {e}") # Manejo de errores 
            return jsonify({"status":"error", "msg": "Error al actualizar los datos. Inténtelo nuevamente ❌"}), 500
    
    # Funcion para cambiar contraseña de usuario
    def cambiar_contrasena_usuario(self):
        try:
            # Obtener el id del usuario desde la sesión
            fk_usuario = Usuario.get_user_by_session()
            if not fk_usuario:
                raise ValueError("Usuario no encontrado en sesión.")
            print("Usuario ID en sesión:", fk_usuario)
            
            # Obtener la contraseña del usuario almacenada en la base de datos
            stored_password = Usuario.get_user_password(fk_usuario)
            print("Contraseña almacenada :", stored_password)
            
             # Obtener los datos del formulario
            new_password = request.form.get("new_password","").strip()
            confirm_password = request.form.get("confirm_password","").strip()
            actual_password = request.form.get("actual_password","").strip()

            # Imprimir los datos recibidos para depuración
            print("Cambio de contraseña solicitado para usuario ID:", fk_usuario
                  , "Contraseña actual ingresada:", actual_password
                  , "Nueva contraseña ingresada:", new_password
                  , "Confirmación de nueva contraseña ingresada:", confirm_password
                )
                    
            # VALIDACIONES ANTES DE ACTUALIZAR 
            
            #Validar que se haya obtenido la contraseña almacenada
            if stored_password is None:
                return jsonify({"status":"error", "msg": "No se pudo obtener la contraseña almacenada ❌"}), 400
            
             #Validar que la contraseña actual ingresada coincida con la almacenada
            if actual_password != stored_password:
                return jsonify({"status":"error", "msg": "La contraseña actual es incorrecta ❌"}), 400
            
            # Validar que los campos no esten vacios
            if not new_password or not confirm_password:
                return jsonify({"status":"warning","msg" : "Los campos no pueden estar vacíos  ⚠"}), 400
            
            # Validar que la nueva contraseña no sea igual a la actual
            if new_password == actual_password:
                return jsonify({"status":"warning", "msg" : "La nueva contraseña no puede ser igual a la actual ⚠"}), 400
            
            # Validar condiciones de la nueva contraseña   
            if len(new_password) < 8:
                return jsonify({"status":"warning", "msg": "La contraseña debe tener mínimo 8 caracteres ⚠"}), 400
            
            if len(new_password) > 20:
                return jsonify({"status":"warning", "msg": "La contraseña debe tener máximo 20 caracteres ⚠"}), 400
            
            # Validar complejidad de la nueva contraseña
            patron_password = r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.,;:\-_])[A-Za-z\d@$!%*?&.,;:\-_]{8,}$'
            if not re.fullmatch(patron_password, new_password):
                return jsonify({"status":"warning", "msg": "La contraseña debe tener mínimo 8 caracteres, una mayúscula, un número y un caracter especial ⚠"}), 400
            
            if new_password != confirm_password:
                return jsonify({"status":"warning", "msg": "La nueva contraseña y su confirmación no coinciden ⚠"}), 400
            
            # Actualizar la contraseña en la base de datos cuando pase todas las validaciones
            actualizado = Usuario.change_user_password(fk_usuario, new_password)
            
            # Manejo de errores en la actualización
            if not actualizado: 
                return jsonify({"status":"error", "msg": "No se pudo actualizar la contraseña ❌"}), 400
            return jsonify({"status":"success", "msg": "Contraseña actualizada correctamente ✅"}), 200 # Mensaje de éxito

        except Exception as e:
            print(f" Error al cambiar contraseña: {e}") 
            return jsonify({"status":"error", "msg": "Error al cambiar la contraseña. Inténtelo nuevamente ❌"}), 500 # Mensaje de error

    def recuperar_contrasena(self):
        try:
            if request.method == 'POST':
                
                username = request.form.get('username', '').strip()
                email = request.form.get('email', '').strip().lower()
                
                if not username or not email:
                    return jsonify({"status":"warning", "msg": "Todos los campos son obligatorios.⚠"}), 400
            
                user = Usuario.get_user_by_name(username)
                
                # Validar existencia de usuario en la base de datos
                if not user:
                    return jsonify({"status":"error", "msg": "Nombre de usuario no encontrado. Inténtelo de nuevo.❌"}), 400
                
                fk_usuario = user.id_usuario
                
                usuario_data = Usuario.get_user_account(fk_usuario)
                
                if not usuario_data:
                    return jsonify({"status":"error", "msg": "No se pudo obtener la información del usuario.❌"}), 400
                
                email_correcto = usuario_data.get("email", "").lower()
                if not email_correcto:
                    return jsonify({"status":"error", "msg": "No se pudo obtener el correo almacenado ❌"}), 400
                
                if email_correcto != email:
                    return jsonify({"status":"warning", "msg": "El correo ingresado no coincide con el correo registrado. Inténtelo nuevamente. ⚠"}), 400
                
                contrasena_temporal = generar_contrasena_temporal()
                try: 
                    
                    actualizado = Usuario.change_user_password(fk_usuario, contrasena_temporal)
                    
                    # Manejo de errores en la actualización
                    if not actualizado: 
                        return jsonify({"status":"error", "msg": "No se pudo actualizar la contraseña ❌"}), 400
                    
                    
                    nombre = usuario_data["nombres"]
                    apellido = usuario_data["apellidos"]
                    email = usuario_data["email"]
                    username = usuario_data["nombre_usuario"]
                    
                    enviar_correo_recuperacion(email, username, contrasena_temporal, nombre,apellido)
                    
                    return jsonify({"status":"success", "msg": "Correo de recuperación enviado ✅ "}), 200
                    
                except Exception as e:
                    print(f"Error específico en recuperación: {e}")
                    return jsonify({"status":"error", "msg": "Error al enviar la contraseña temporal ❌"}), 500 # Mensaje de error 
        
        except Exception as e:
            print(f" Error al recuperar contraseña: {e}") 
            return jsonify({"status":"error", "msg": "Error en el proceso de recuperación de contraseña. Inténtelo nuevamente ❌"}), 500 # Mensaje de error    
    
    def actualizar_usuario_admin(self):
       
        try:
            # Obtener datos del formulario
            user_id = request.form.get('user_id')
            username = (request.form.get("nombre_usuario") or "").strip() or None
            rol = request.form.get("rol")
            contrasena = request.form.get("password")
            
            # Validar que el usuario existe
            usuario_existente = Usuario.get_user_by_id(user_id)
            if not usuario_existente:
                return jsonify({"status": "error", "msg": "Usuario no encontrado. ❌"}), 400
            
            campos_para_actualizar = []
            if username and username.strip():
                campos_para_actualizar.append("username")
            if rol and rol.strip():
                campos_para_actualizar.append("rol") 
            if contrasena and contrasena.strip():
                campos_para_actualizar.append("contraseña")
            
            if not campos_para_actualizar:
                return jsonify({"status": "warning", "msg": "Debe proporcionar al menos un campo para actualizar. ⚠"}), 400
            
            
            if username:                    
                if len(username) <4 or len(username) > 10:
                    return jsonify({"status": "warning", "msg": "El nombre de usuario debe tener entre 4 y 10 caracteres. ⚠"}), 400
                if Usuario.username_exists_excluding_current(username, user_id):
                    return jsonify({"status": "error", "msg": "El nombre de usuario ya está en uso. Por favor, elegir otro. ❌"}), 400
            
            if contrasena:
                patron_password = r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.,;:\-_])[A-Za-z\d@$!%*?&.,;:\-_]{8,}$'

                if not re.fullmatch(patron_password, contrasena):
                    return jsonify({"status": "error", "msg": "La contraseña debe tener mínimo 8 caracteres, una mayúscula, un número y un caracter especial. ❌"}), 400
            
            contrasena_final = contrasena if (contrasena and contrasena.strip()) else None
            fk_rol = rol if (rol and rol.strip()) else None
            
            actualizado = Usuario.update_user_admin(
                user_id=user_id,
                username=username,
                fk_rol=fk_rol,
                contrasena = contrasena_final
            )

            usuario = Usuario.get_user_account(user_id)
            
            raw_password = usuario["contrasena"] or ""
            visible_part = raw_password[-2:] 
            masked ="••" * (len(raw_password) - 2) + visible_part 
            usuario["contrasena_masked"] = masked
            
            nombre = usuario["nombres"]
            apellido = usuario["apellidos"]
            correo = usuario["email"]
            username = usuario["nombre_usuario"]
            fk_rol = usuario["rol_usuario"]
            contrasena = usuario["contrasena_masked"]
            
            enviar_correo_actualizacion_datos_admin(nombre, apellido, correo, username,fk_rol, contrasena)
            
            print(f"DEBUG - Resultado de actualización: {actualizado}")
            
            if actualizado:
                return jsonify({
                    "status": "success", 
                    "msg": "Usuario actualizado correctamente.✅"
                }), 200
            else:
                return jsonify({
                    "status": "error", 
                    "msg": "Error al actualizar usuario.❌"
                }), 400
                
        except Exception as e:
            print(f"Error en controlador al actualizar usuario: {e}")
            return jsonify({
                "status": "error", 
                "msg": "Error en el proceso de actualización. ❌"
            }), 500
    
class Eliminar:
    def __init__(self):
        pass
    
    def eliminar_usuario(self):
        
        data = request.get_json()
        user_id = data.get('user_id')
        
        if not data or not user_id:
            return jsonify({"status": "error", "msg": "Datos no proporcionados. ❌"}), 400
        
        
        try:
            usuario = Usuario.get_user_by_id(user_id)
            if not usuario:
                return {"status": "error", "msg": "Usuario no encontrado. ⚠"},400
            
            eliminado = Usuario.delete_user(user_id)
            
            if eliminado:
                return jsonify({"status": "success", "msg": "Usuario desactivado correctamente.✅"}),200
            
            else:
                return jsonify({"status":"error", "msg": "Error al desactivar usuario.❌"}), 400
        except Exception as e:
            print(f" Error al desactivar usuario: {e}") 
            return jsonify({"status":"error", "msg": "Error en el proceso de desactivación.❌"}), 500 # Mensaje de error 

class Enviar:
    def __init__(self):
        pass
    
    def enviar_registro_caso(self):
        try:
            data = request.get_json()
            caso_id = data.get('caso_id')
            
            #Obtener los datos del caso desde la base de datos
            caso = Caso.get_case_by_id(caso_id)  
            if not caso:
                return jsonify({
                    "status": "error", 
                    "msg": "Caso no encontrado"
                }), 404
            
            
            usuario = Caso.get_user_by_case(caso_id)
            
            if usuario:
                caso['nombre_completo'] = usuario.get('nombre_completo', 'Usuario no identificado')
                caso['email_usuario'] = usuario.get('email', '')
                caso['num_contacto_usuario'] = usuario.get('num_contacto', 'No disponible')
            else:
                caso['nombre_completo'] = 'Usuario no identificado'
                caso['email_usuario'] = ''
                caso['num_contacto_usuario'] = 'No disponible'
                
            
            
            # Obtener la entidad responsable según el tipo de desastre
            entidad = Desastre.get_entidad_by_desastre_id(caso['id_desastre'])  
            if not entidad:
                return jsonify({
                    "status": "error", 
                    "msg": "No se encontró la información de la entidad responsable para este desastre"
                }), 404
            
            # Enviar el correo
            enviar_correo_caso_entidad(
                entidad['correo'],
                caso,
                entidad['nombre_entidad']
            )
            
            return jsonify({
                "status": "success", 
                "msg": "Correo enviado correctamente a la entidad responsable ✅"
            }), 200
            
        except Exception as e:
            print(f"Error al enviar correo del caso: {e}")
            return jsonify({
                "status": "error", 
                "msg": "Error al enviar el correo"
            }), 500
            
    
        
            
            
            
            
        