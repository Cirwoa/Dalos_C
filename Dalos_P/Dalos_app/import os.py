import os
os.system('cls')

class calculadora:
    def __init__(self):
        self.division
        self.multiplicacion
        self.suma
        self.resta
        
    def division():
        div1= int(input('ingrese el primer valor'))
        div2= int(input('ingrese el segundo valor '))
        resultadodiv= div1 /div2
        print('el resultado de la division es: ', resultadodiv)

    def resta():
        resta1 = int(input('ingrese el primer valor: '))
        resta2 = int(input('ingrese el segundo valor'))
        resultadoresta= resta1 - resta2
        print('el valor de la resta es :', resultadoresta)
        
    def multiplicacion():
        multi1=int(input('ingrese el primer valor: '))
        multi2=int(input('ingrese el segundo valor'))
        resultadomulti= multi1 * multi2
        print('el valor de la multiplicacion es: ', resultadomulti)
    
    def suma(self):
        suma1= int(input('ingrese el primer valor: '))
        suma2=  int(input('ingrese el segundo valor: '))
        resultadosuma = suma1 + suma2
        print('el valor de la suma es: ', resultadosuma) 
calculadora()
op = int(input('ingrese la opcion'))
if op == 1:
    calculadora.suma