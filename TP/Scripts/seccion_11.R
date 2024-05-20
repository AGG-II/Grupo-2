library(readxl)
# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_11.xlsx")
seccion11 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_11 - Hoja 11.csv")
write.csv(seccion11, path_csv, row.names = TRUE)
datos_csv <- read.csv(path_csv)

# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_10.xlsx")
seccion10 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_10 - Hoja 10.csv")
write.csv(seccion10, path_csv, row.names = TRUE)
datos2_csv <- read.csv(path_csv)

fuente = "Fuente: Observatorio Villero, 2022"

# Análisis bivariado: Relación entre la distancia a basurales y la presencia de plagas en la vivienda y sus alrededores
# con gráfico de barras subdivididas
datos1 <- datos_csv$Basurales.cerca
frecuencias1 <- table(datos1)

datos2 <- datos2_csv$X.Cuáles.plagas.
frecuencias2 <- table(datos2)

# library
library(ggplot2)

# create a dataset
#specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
specie <- names(frecuencias1)
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)

# Stacked
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="stack", stat="identity")

