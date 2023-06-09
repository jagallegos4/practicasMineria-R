# 1: Leo datos desde un archivo csv
#datos<-read.csv('C:/Mario/RCodigos/especvida.csv',sep=';',header=TRUE,dec=',',stringsAsFactors = FALSE)
datos=read.table(file = "https://raw.githubusercontent.com/martintinch0/CienciaDeDatosParaCuriosos/master/data/gapminder.csv",
                 sep=';',
                 header = TRUE,
                 stringsAsFactors = FALSE)
View(datos)

# 2: Vemos todos los datos
ggplot(data = datos,
       mapping = aes(x=gdpPercap, y = lifeExp)) +
  geom_point()

# 3: Filtramos los datos solamente para tener 2007
datos2007 <- datos %>% filter(year==2007)

# 4: Vemos datos filtrados
ggplot(data = datos2007,
       mapping = aes(x=gdpPercap, y = lifeExp)) +
  geom_point()

# 5: Cambiamos etiquetas en visualizacion
ggplot(data = datos2007,
       mapping = aes(x=gdpPercap, y = lifeExp)) +
  geom_point() +
  labs(x = "PIB per c�pita",
       y = "Expectativa de vida al nacer (en a�os)")

# 6: Usamos labs(), con sus respectivos par�metros x e y, 
# a los que les pasamos directamente el nombre que queremos que tenga. 
# La funci�n labs permite m�s cosas que esto, como agregar t�tulo, 
# subt�tulos e incluso informaci�n sobre la fuente de nuestro gr�fico
ggplot(data = datos2007,
       mapping = aes(x=gdpPercap, y = lifeExp)) +
  geom_point() +
  labs(x = "PIB per c�pita",
       y = "Expectativa de vida al nacer (en a�os)",
       title="A m�s ingresos mayor tiempo de vida?",
       subtitle="Expectativa de vida al nacer seg�n nivel de ingreso",
       caption="Fuente: Gapminder")

# 7: Agregamos colores a continenetes
ggplot(data = datos2007,
       mapping = aes(x=gdpPercap, y = lifeExp,color=continent)) +
  geom_point() +
  labs(x = "PIB per c�pita",
       y = "Expectativa de vida al nacer (en a�os)",
       title="A m�s ingresos mayor tiempo de vida?",
       subtitle="Expectativa de vida al nacer seg�n nivel de ingreso",
       caption="Fuente: Gapminder")

# 8: Observamos la evoluci�n de la expectativa de vida al nacer promedio 
# por continente en una l�nea de tiempo
promedioContinente <- datos %>%
  group_by(continent,year) %>%
  summarise(promedio=mean(lifeExp))

ggplot(data = promedioContinente,
       mapping = aes(x=year, y = promedio,color=continent)) +
  geom_line() +
  labs(x = "",
       y = "Expectativa de vida al nacer (en a�os)",
       title="Expectativa de vida al nacer seg�n continente",
       caption="Fuente: Gapminder")
