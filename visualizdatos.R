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
  labs(x = "PIB per cápita",
       y = "Expectativa de vida al nacer (en años)")

# 6: Usamos labs(), con sus respectivos parámetros x e y, 
# a los que les pasamos directamente el nombre que queremos que tenga. 
# La función labs permite más cosas que esto, como agregar título, 
# subtítulos e incluso información sobre la fuente de nuestro gráfico
ggplot(data = datos2007,
       mapping = aes(x=gdpPercap, y = lifeExp)) +
  geom_point() +
  labs(x = "PIB per cápita",
       y = "Expectativa de vida al nacer (en años)",
       title="A más ingresos mayor tiempo de vida?",
       subtitle="Expectativa de vida al nacer según nivel de ingreso",
       caption="Fuente: Gapminder")

# 7: Agregamos colores a continenetes
ggplot(data = datos2007,
       mapping = aes(x=gdpPercap, y = lifeExp,color=continent)) +
  geom_point() +
  labs(x = "PIB per cápita",
       y = "Expectativa de vida al nacer (en años)",
       title="A más ingresos mayor tiempo de vida?",
       subtitle="Expectativa de vida al nacer según nivel de ingreso",
       caption="Fuente: Gapminder")

# 8: Observamos la evolución de la expectativa de vida al nacer promedio 
# por continente en una línea de tiempo
promedioContinente <- datos %>%
  group_by(continent,year) %>%
  summarise(promedio=mean(lifeExp))

ggplot(data = promedioContinente,
       mapping = aes(x=year, y = promedio,color=continent)) +
  geom_line() +
  labs(x = "",
       y = "Expectativa de vida al nacer (en años)",
       title="Expectativa de vida al nacer según continente",
       caption="Fuente: Gapminder")
