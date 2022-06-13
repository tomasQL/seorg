"""
conexion_mysql.py 
nos permitirá establecer el DAO
a utilizar durante las operaciones de 
los distintos usarios.

"""

import mysql.connector
from mysql.connector import Error
 
class DAO():
    
    def __init__(self):
        try: 
            self.conexion = mysql.connector.connect(
                host='localhost',
                port=3306,
                user='root',
                password='seorgdb',
                db='mydb'
            )
        except Error as ex:
            print("Error al intentar la conexion: {0}".format(ex))
            
            
# métodos para manipular la base de datos para el usuario Organizació
def eliminarDatosOrganizacion(self, eliminarDatosOrg):
    """
    Método con restricciones. Admin podrá usarlo en todo momento 
    y los usuarios del sistema solo podrán usarlo para eliminar su cuenta
    """
    if self.conexion.is_connected():
        try: 
            cursor = self.conexion.cursor()
            sql = "DELETE FROM organizacion WHERE id = '{0}',"
            cursor.execute(sql.format(eliminarDatosOrg))
            self.conexion.commit()
            print("Datos eliminados correctamente")
        except Error as ex:
            print("Error al intentar la conexion: {0}".format(ex))
            

    def consultarDatosOrganizacion(self, nicknameOrg, passwordOrg):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                cursor.execute("SELECT '{nicknameOrg}','{passwordOrg}' FROM organizacion".format(nicknameOrg, passwordOrg))
                resultados = cursor.fetch()
                return resultados
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))

    def registrarOrganizaciones(self, nickname, password):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sql = "INSERT INTO curso (nickname, password ) VALUES ('{0}', '{1}', {2})"
                cursor.execute(sql.format(nickname[0], password[1]))
                self.conexion.commit()
                print("¡Curso registrado!\n")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))

    def actualizarInfoOrganización(self, org):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sql = "UPDATE organizacion SET nombreOrganizacon = '{0}',  = {1} WHERE  = '{2}'"
                cursor.execute(sql.format(param1[1], param2[2], [0]))
                self.conexion.commit()
                print("¡Curso actualizado!\n")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))

        
            