#Correlación lineal (Pearson)
url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/aptos2015'
datos <- read.table(file=url, header=T)
cor(x=datos$mt2, y=datos$precio)

#Graficamos los datos
with(datos, plot(x=mt2, y=precio, pch=20, col='blue',
                 xlab='Área del apartamento', las=1,
                 ylab='Precio del apartamento (millones COP)'))

#Uso otras correlaciones
cor(x=datos$mt2, y=datos$precio, method='kendall')
cor(x=datos$mt2, y=datos$precio, method='spearman')

#Veo variables cuantitativas que tienen mayor correlación
#descarto variables cualitativas
str(datos)
datos.cuanti <- datos[, c(1, 2, 5, 6, 9, 10)]

# La siguiente instrucción para editar los nombres de la variables
colnames(datos.cuanti) <- c('Precio', 'Área', 'Alcobas',
                            'Baños', 'Admon', 'Avaluo')
M <- round(cor(datos.cuanti), digits=2)
M

#Es posible representar gráficamente la matriz de correlaciones M 
#por medio de la función corrplot del paquete corrplot
library('corrplot')
corrplot.mixed(M)

#Otro ejemplo con valores incompletos NA
gasto <- c(170, 230, 120, 156, 256, NA, 352)
ahorro <- c(45, 30, NA, 35, 15, 65, 15)
cor(gasto, ahorro)
cor(gasto, ahorro, use='complete.obs')

