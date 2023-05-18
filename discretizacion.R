library(discretization)
#Discretizamos iris
data<-iris
View(data)
data_dis<-mdlp(data)
data_dis$cutp #Intervalos
head(data_dis$Disc.data) #Data discretizada

#Ahora discretizaremos una base externa denominada haberman que es 
#un conjunto de datos que contiene los casos de un estudio que se 
#llev? a cabo entre 1958 y 1970 en el Hospital Billings de la 
#Universidad de Chicago sobre la supervivencia de pacientes que 
#se hab?an sometido a una cirug?a por c?ncer de mama. 
#Contiene tres atributos (edad del paciente,a?o de operaci?n, 
#n?mero de ganglios detectados) y una clase que muestra 
#si el paciente sobrevivi? 5 a?os m?s o si muri? antes de los cinco a?os.

#archivo descargado
haberman <- read.csv('F:/ESPE VIRTUAL/Mineria de datos/Practicas en R/haberman_ganglios.csv',sep=',',header=TRUE,dec=',')
head(haberman)
data_dis<-mdlp(haberman)
head(data_dis$Disc.data)

#archivo en url
haberman <- read.csv("https://raw.githubusercontent.com/IranNash/datasets/master/haberman.csv")
head(haberman)