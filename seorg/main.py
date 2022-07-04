

""" Intefaz de bienvenida - 
"""


from interfaz_admin import InterfazAdmin
from interfaz_cliente import InterfazCliente
from interfaz_org import  Organizacion


def menuBienvenida():
    continuar = True
    while(continuar):
        opcionCorrecta = False
        while(not opcionCorrecta):
            print("================== Menú de Bienvenida ==================")
            print("Elija su tipo de usuario:")
            print("1. Usuario tipo organización")
            print("2. Usuario tipo cliente")
            print("3. Usuario tipo administrador")
            print("4. Salir")
            print("========================================================")
            opcion = int(input("Seleccione una opción: "))

            if opcion < 1 or opcion > 4:
                print("Opción incorrecta, ingrese nuevamente...")
            elif opcion == 4:
                continuar = False
                print("Gracias por su timepo, vuelva pronto!")
                break
            else:
                opcionCorrecta = True
                ejecutarOpcion(opcion)
                
def ejecutarOpcion(opcion):

    if opcion == 1:
        try:
            Organizacion.InterfazOrganizacion()
        except:
            print("Ocurrió un error...")
    if opcion == 2:
        try: 
            InterfazCliente()
        except:
            print("Ocurrió un error...")
    if opcion == 2:
        try:
            InterfazAdmin()
        except:
            print("Ocurrió un error...")
                
menuBienvenida()
