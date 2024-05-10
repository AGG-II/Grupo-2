library(readxl)
# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_4.xlsx")
seccion4 <- read_xlsx(path_xlsx)
# datos_csv <- read.csv("Home/Escritorio/PyE/TP/Grupo-2/TP/Secciones/Seccion_4 - Hoja 4.csv")
#path_xlsx <- paste(path_actual, "/TP/Secciones/xlsx/Seccion_4.xlsx")

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_4 - Hoja 4.csv")
write.csv(seccion4, path_csv, row.names = TRUE)
datos_csv <- read.csv(path_csv)

attach(datos_csv)

#Propiedad de la vivienda con Grafico de barras 
frecuencias1 <- table(El.lugar.que.habitan.es.)

indices_ordenados <- order(frecuencias1, decreasing = TRUE)
frecuencias1 <- frecuencias1[indices_ordenados]

grafico3 <- barplot(frecuencias1, main = "PROPIEDAD DE LA VIVIENDA\nNORTE DE ARGENTINA, 2022", xlab = "Propiedad sobre la vivienda", ylab = "Frecuencia",col = "lightblue")
grafico3 <-mtext("Fuente: Observatorio villero",side = 1,line = 4, at = NA,adj = 0,cex = NA)
tabla_resumen <- data.frame(Propiedad_de_la_vivienda = names(frecuencias1), Frecuencia = as.numeric(frecuencias1))
print(tabla_resumen)

#Existencia de contrato de alquiler firmado con Grafico de sectores circulares 

par(mar = c(2, 2, 2, 2), cex = 0.7)
grafico_torta <- pie(x = xA, labels = porcentajes, clockwise = FALSE, main = "PRINCIPAL SIGNO VISIBLE EN PACIENTES CON ANOREXIA\nARGENTINA, OCTUBRE 2012")
mtext(text = fuente, side = 1, line = 0, adj = 0, cex = 0.5)