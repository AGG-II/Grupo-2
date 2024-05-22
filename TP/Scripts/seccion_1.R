library(readxl)
# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_1.xlsx")
seccion1 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_1 - Hoja 1.csv")
write.csv(seccion1, path_csv, row.names = TRUE)
datos_csv <- read.csv(path_csv)

#Tiempo de residencia en la vivienda con histograma
data1<- datos_csv$Tiempo.de.residencia.en.la.vivienda
data1 <- data1[!data1 %in% "111"]
grafico1 <- hist(data1,
                 main = "AÑOS DE RESIDENCIA EN LA VIVIENDA EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022",
                 xlab = "Tiempo de residencia (en años)", 
                 ylab = "Cantidad de viviendas",
                 xlim = c(floor(min(data1)), ceiling(max(data1))),
                 breaks = seq(floor(min(data1)), ceiling(max(data1)), by = 10), 
                 xaxt = "n",
                 yaxt = "n",
                 col = "purple")
grafico1 <-mtext("Fuente: Observatorio villero",side = 1,line = 4, at = NA,adj = 0,cex = NA)
axis(1, at = seq(floor(min(data1)), ceiling(max(data1)), by = 10))
y_vals <- pretty(table(data1))
axis(2, at = seq(min(y_vals), 135, by = 5))

medidasResumen <- summary(data1)
mediana <- medidasResumen[3]
ri <- medidasResumen[5] - medidasResumen[2]
names(ri) <- "Rango intercuartílico"


#Cantidad de integrantes en la vivienda con Grafico de bastones
datos2 <- datos_csv$Cantidad.de.integrantes
frecuencias1 <- table(datos2)
grafico3 <- plot(frecuencias1, 
                 main = "CANTIDAD DE INTEGRANTES POR VIVIENDA EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022", 
                 xlab = "Cantidad de integrantes", 
                 ylab = "Cantidad de viviendas",
                 col = "purple")
grafico3 <-mtext("Fuente: Observatorio Villero, 2022",side = 1,line = 4, at = NA,adj = 0,cex = NA)


medidasResumen2 <- summary(datos2)
mediana2 <- medidasResumen2[3]
ri2 <- medidasResumen2[5] - medidasResumen2[2]
names(ri2) <- "Rango intercuartílico"
'''
datos_filtrados <- datos2[datos2 > 5]
porc <- length(datos_filtrados) * 100 / length(datos2)'''
