import os 
os.system("cls")

def iva(cant,desc,pu):
    monto=cant*pu
    return monto



list_desc=[]
list_pu=[]
list_cant=[]


continuar=""
continuar=input("ingresa al systema con (y): ")
while continuar=="y":

 desc=input("ingrese producto:")
 list_desc.append(desc)

 cant=float(input("ingrese cantidad:"))
 list_cant.append(cant)

 pu=float(input("ingrese precio:"))
 list_pu.append(pu)


continuar=input("¿ingresa otro item?:")

print("productos:" + str(list_desc))
print("cantidad:"+  str(list_cant))
print("precio:"  + str(list_pu))
