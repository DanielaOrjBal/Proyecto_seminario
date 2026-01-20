from datetime import datetime
from app.extensions import mail
from flask_mail import Message
from flask import render_template
import locale
import os
import random
import string

# ======================== Funciones generales para el funcionamiento del proyecto ========================

locale.setlocale(locale.LC_TIME, 'spanish') 

# Función para formatear fechas al formato "Día, DD de Mes de YYYY"
def formatear_fecha(fecha):
    if isinstance(fecha, datetime):
        fecha_formateada = fecha.strftime("%A, %d de %B de %Y").capitalize()
    else:
        try:
            fecha_obj = datetime.strptime(str(fecha), "%a, %d %b %Y %H:%M:%S %Z")
            fecha_formateada = fecha_obj.strftime("%A, %d de %B de %Y").capitalize()
        except:
            fecha_formateada = str(fecha)
    
    return fecha_formateada

def validar_fecha(fecha):
    try:
        fecha_caso = datetime.strptime(fecha, "%Y-%m-%d").date()
        fecha_actual = datetime.now().date()
        fecha_minima = datetime (2000, 1, 1).date()
        
        if fecha_caso > fecha_actual:
            return "La fecha no puede ser posterior a la actual. ⚠"
        if fecha_caso < fecha_minima:
            return "La fecha no puede ser anterior al 1 de enero del año 2000. ⚠"
        
    except ValueError:
        return "Formato de fecha inválido. Use el formato AAAA-MM-DD. ⚠"
    return None 

def validar_edad(fecha_nac):
    try:
        fecha_nacimiento = datetime.strptime(fecha_nac, "%Y-%m-%d")
        fecha_actual = datetime.now()
        
        edad = fecha_actual.year - fecha_nacimiento.year - ((fecha_actual.month, fecha_actual.day) < (fecha_nacimiento.month, fecha_nacimiento.day))
        print(f"Fecha nacimiento: {fecha_nacimiento}, Edad calculada: {edad}")
        
        return edad
    except ValueError as e:
        print(f"Error en formato de fecha al calcular edad: {e}")
        return None
    except Exception as e:
        print(f"Error inesperado al calcular edad: {e}")
        return None
    
def validar_caracteres_consecutivos(texto, max_consecutivos = 4):
    if not texto or len(texto) < max_consecutivos:
        return True
    
    texto= texto.upper()
    consecutivos = 1
    caracter_anterior = texto[0]
    
    for i in range (1,len(texto)):
        if texto[i] == caracter_anterior:
            consecutivos += 1
            if consecutivos >= max_consecutivos:
                return False
        
        else:
            consecutivos= 1 
            caracter_anterior = texto[i]
    
    return True
def validar_número_documento(texto, max_consecutivos = 6):
    if not texto or len(texto) < max_consecutivos:
        return True
    
    consecutivos = 1
    caracter_anterior = texto[0]
    
    for i in range (1,len(texto)):
        if texto[i] == caracter_anterior:
            consecutivos += 1
            if consecutivos >= max_consecutivos:
                return False
        
        else:
            consecutivos= 1 
            caracter_anterior = texto[i]
    
    return True
            
def generar_contrasena_temporal():
    # Caracteres disponibles
    mayusculas = string.ascii_uppercase
    minusculas = string.ascii_lowercase
    numeros = string.digits
    especiales = '@$!%*?&.,;:-_'
                
    # Asegurar al menos un carácter de cada tipo
    password = [
        random.choice(mayusculas),     
        random.choice(numeros),         
        random.choice(especiales)       
        ]
                
    # Completar hasta 10 caracteres con caracteres aleatorios
    token = mayusculas + minusculas + numeros + especiales
    password += [random.choice(token) for _ in range(7)]
                
    # Mezclar los caracteres
    random.shuffle(password)
                
    # Convertir a string
    return ''.join(password)


def enviar_correo_registro(primer_nombre,primer_apellido,email,username):
    try:
        asunto = "Bienvenido a VITARIA SOS"
        cuerpo = render_template('correos/correo_registro.html',
                             nombre=primer_nombre, apellido=primer_apellido, username=username, email= email)
    
        msg = Message(
            subject=asunto,
            recipients=[email], 
            html=cuerpo
            )
        logo_path = os.path.join("app", "static", "img", "logo_correo.png")
        
        if os.path.exists(logo_path):
                with open(logo_path, "rb") as f:
                    msg.attach(
                        filename="logo_vitaria.png",
                        content_type="image/png",
                        data=f.read(),
                        headers={"Content-ID": "<logo_vitaria>"}
                    )
        else:
            print(f"Logo no encontrado en: {logo_path}. Se enviará sin imagen.")
            
        mail.send(msg)
        print(f"Correo de registro enviado a {email}")

    except Exception as e:
        print(f" Error al enviar correo de registro: {e}")
        
def enviar_correo_caso(fecha,descripcion,personas_afectadas,email,nombre,apellido,desastre):
    try:
        asunto = "Registro de Caso exitoso"
        cuerpo = render_template('correos/correo_registro_caso.html',
                             nombre=nombre, apellido=apellido, fecha= fecha,descripcion= descripcion, personas_afectadas= personas_afectadas,desastre=desastre)
        
        msg = Message(
            subject=asunto, 
            recipients=[email], 
            html=cuerpo
            )

        logo_path = os.path.join("app", "static", "img", "logo_correo.png")
        
        if os.path.exists(logo_path):
                with open(logo_path, "rb") as f:
                    msg.attach(
                        filename="logo_vitaria.png",
                        content_type="image/png",
                        data=f.read(),
                        headers={"Content-ID": "<logo_vitaria>"}
                    )
        else:
            print(f"Logo no encontrado en: {logo_path}. Se enviará sin imagen.")

        mail.send(msg)
        print(f"Enviando correo a {email} con datos: {nombre} {apellido} - {desastre}")


    except Exception as e:
        import traceback
        traceback.print_exc()
        print(f" Error al enviar correo de registro: {e}")

def enviar_correo_actualizacion_datos(nombre,apellido, direccion, correo,telefono, edad, username):
    try:
    
        asunto = "Actualización de datos"
        cuerpo = render_template('correos/correo_actualizacion.html',
                            nombre= nombre, apellido=apellido,
                            direccion= direccion, email= correo, telefono=telefono, edad=edad, username=username
                            )
        
        msg = Message(
            subject=asunto, 
            recipients=[correo], 
            html=cuerpo
            )

        logo_path = os.path.join("app", "static", "img", "logo_correo.png")
        
        if os.path.exists(logo_path):
                with open(logo_path, "rb") as f:
                    msg.attach(
                        filename="logo_vitaria.png",
                        content_type="image/png",
                        data=f.read(),
                        headers={"Content-ID": "<logo_vitaria>"}
                    )
        else:
            print(f"Logo no encontrado en: {logo_path}. Se enviará sin imagen.")

        mail.send(msg)
        print(f"Enviando correo a {correo} con datos: {nombre} {apellido} - {username}")


    except Exception as e:
        import traceback
        traceback.print_exc()
        print(f" Error al enviar correo de registro: {e}")
 
def enviar_correo_actualizacion_datos_admin(nombre, apellido, correo, username,fk_rol, contrasena):
    try:
        asunto = "Actualización de datos administrativos"
        cuerpo = render_template('correos/correo_actualizacion_ad.html',
                        nombre = nombre, apellido = apellido, username=username,fk_rol = fk_rol, contrasena = contrasena
                        )
        
        msg = Message(
            subject=asunto, 
            recipients=[correo], 
            html=cuerpo
            )

        logo_path = os.path.join("app", "static", "img", "logo_correo.png")
        
        if os.path.exists(logo_path):
                with open(logo_path, "rb") as f:
                    msg.attach(
                        filename="logo_vitaria.png",
                        content_type="image/png",
                        data=f.read(),
                        headers={"Content-ID": "<logo_vitaria>"}
                    )
        else:
            print(f"Logo no encontrado en: {logo_path}. Se enviará sin imagen.")

        mail.send(msg)
        print(f"Enviando correo a {correo} con datos: {nombre} {apellido} - {username}")


    except Exception as e:
        import traceback
        traceback.print_exc()
        print(f" Error al enviar correo de registro: {e}")
 
def enviar_correo_recuperacion(email, username, token, nombre,apellido):
    try:
        asunto = "Recuperación de contraseña"
        cuerpo = render_template('correos/correo_recuperacion.html',
                             email= email, username=username, token = token,
                             nombre = nombre, apellido = apellido
                            )
        
        msg = Message(
            subject=asunto, 
            recipients=[email], 
            html=cuerpo
            )

        logo_path = os.path.join("app", "static", "img", "logo_correo.png")
        
        if os.path.exists(logo_path):
                with open(logo_path, "rb") as f:
                    msg.attach(
                        filename="logo_vitaria.png",
                        content_type="image/png",
                        data=f.read(),
                        headers={"Content-ID": "<logo_vitaria>"}
                    )
        else:
            print(f"Logo no encontrado en: {logo_path}. Se enviará sin imagen.")

        mail.send(msg)
        print(f"Enviando correo a {email} con token de recuperación: {token}")


    except Exception as e:
        import traceback
        traceback.print_exc()
        print(f" Error al enviar correo de recuperación: {e}")


def enviar_correo_caso_entidad(correo_entidad, caso, nombre_entidad):
    try:
        correo_entidad = "danielaorjbal@gmail.com"
        asunto = "Caso de desastre natural registrado en VITARIA SOS"
        cuerpo = render_template('correos/correo_entidad.html',
                            caso=caso,
                             entidad=nombre_entidad
                            )
        
        msg = Message(
            subject=asunto, 
            recipients=[correo_entidad], 
            html=cuerpo
            )

        logo_path = os.path.join("app", "static", "img", "logo_correo.png")
        
        if os.path.exists(logo_path):
                with open(logo_path, "rb") as f:
                    msg.attach(
                        filename="logo_vitaria.png",
                        content_type="image/png",
                        data=f.read(),
                        headers={"Content-ID": "<logo_vitaria>"}
                    )
        else:
            print(f"Logo no encontrado en: {logo_path}. Se enviará sin imagen.")

        mail.send(msg)
        print(f"Enviando correo a {correo_entidad} con datos: {caso.get('id', 'N/A')}")


    except Exception as e:
        import traceback
        traceback.print_exc()
        print(f" Error al enviar correo de registro: {e}")

