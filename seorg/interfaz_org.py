
def InterfazOrganizacion():
    continuar = True
    while(continuar):
        opcionCorrecta = False
        while(not opcionCorrecta):
            print("================== Organización ==================")
            print("1. Acceder")
            print("2. Registrarse")
            print("3. Salir")
            print("========================================================")
            opcion = int(input("Seleccione una opción: "))

            if opcion < 1 or opcion > 3:
                print("Opción incorrecta, ingrese nuevamente...")
            elif opcion == 3:
                continuar = False
                print("Gracias por su timepo, vuelva pronto!")
                break
            else:
                opcionCorrecta = True
                ejecutarOpcionOrg(opcion)
    return 

def ejecutarOpcionOrg(opcion):

    if opcion == 1:
        try:
            InterfazLogin()
        except:
            print("Ocurrió un error...")

def InterfazLogin():
    try:
        print("================== Organización -> Login ==================")
        nickname = input("Ingrese su nickname: ")
        password = input("Ingrese su contraseña: ")
        if nickname and password == 1:  
            return            
    except:
        print("Ocurrió un error...")


def MenuOrganizacion():
    return 













