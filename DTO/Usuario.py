from DAO.Conexion import Conexion
import bcrypt

# Parámetros de conexión
host='localhost'
user='root'
passwordS='admin123'
db='empresa'


class Usuario:
    def __init__(self, username, password_hash, nombre, apellidos, email, tipo_usuario):
        self.username = username
        self.password_hash = password_hash
        self.nombre = nombre
        self.apellidos = apellidos
        self.email = email
        self.tipo_usuario = tipo_usuario    

    # ------------------------
    # 🔐 LOGIN
    @staticmethod  # Método estático para iniciar sesión (no requiere instancia de la clase)
    def login(username, password):
        con = None
        try:
            con = Conexion(host, user, passwordS, db)

            usuario_data = con.obtenerUsuario(username)

            if usuario_data:
                hashed_password = usuario_data[2].encode('utf-8')

                # checkpw devuelve True si la contraseña coincide con el hash
                if bcrypt.checkpw(password.encode('utf-8'), hashed_password):
                    return Usuario(
                        username=usuario_data[1],
                        password_hash=usuario_data[2],
                        nombre=usuario_data[3],
                        apellidos=usuario_data[4],
                        email=usuario_data[5],
                        tipo_usuario=usuario_data[6]
                    )

            return None

        except Exception as e:
            print("Error en login:", e)
            return None

        finally:
            if con:
                con.desconectar()

    # ------------------------
    # ➕ REGISTRAR USUARIO
    @staticmethod
    def registrar_usuario(username, password, nombre, apellidos, email, tipo_usuario):
        con = None
        try:
            # 🔐 Generar hash directamente como string
            hashed_password = bcrypt.hashpw(
                password.encode('utf-8'),
                bcrypt.gensalt()
            ).decode('utf-8')

            con = Conexion(host, user, passwordS, db)

            exito = con.agregarUsuario(
                username=username,
                password_hash=hashed_password,
                nombre=nombre,
                apellidos=apellidos,
                email=email,
                tipo_usuario=tipo_usuario
            )

            return exito

        except Exception as e:
            print("Error en registro:", e)
            return False

        finally:
            if con:
                con.desconectar()