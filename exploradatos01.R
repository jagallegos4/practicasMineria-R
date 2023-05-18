
# 1: Leo datos desde un archivo csv
datos<-read.csv('C:/Mario/RCodigos/dprueba.csv',sep=';',header=TRUE,dec=',')
View(datos)

# 2: Medidas de tendencia central
mean(datos$peso)
median(datos$peso)
library(modeest)#para obtener la moda
mfv(datos$edad)#para obtener los valores mas frecuentes
plot(datos$edad,datos$peso)

# 3: Medidas de posicion:calculo de frecuencias absolutas, relativas y cuantiles
# Calculo frecuencias absolutas con table
tabla <- table(datos$tipo)
# la frecuencia absoluta se aplica en atributos tipo factor generalmente
tabla
# Frecuencias relativas (proporciones)
prop.table(tabla)
# Frecuencias relativas (porcentajes)
prop.table(tabla)*100
# Puedo redondear a 2 decimales por ejemplo
round((prop.table(tabla)*100),2)
# Frecuencias absolutas acumuladas
cumsum(tabla)
# Frecuencias relativas acumuladas
cumsum(prop.table(tabla))

# 4 Medidas de dispersion: rango, varianza, desv est., coef de variacion
# Valores max y min con range
range(tabla)
# Min y max
min(datos$edad, na.rm = TRUE) #na.rm si hay valore nulos NA
max(datos$edad, na.rm = TRUE) #na.rm si hay valore nulos NA
# Varianza
var(datos$edad)
# Desv Est
sd(datos$edad)

