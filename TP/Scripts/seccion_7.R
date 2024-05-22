library(readxl)
# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_7.xlsx")
seccion7 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_7 - Hoja 1.csv")
write.csv(seccion7, path_csv, row.names = TRUE)
datos_csv <- read.csv(path_csv)

fuente = "Fuente: Observatorio Villero, 2022"

# Tipo de conexión a la red eléctrica con gráfico de sectores circulares

datos1 <- datos_csv$Conexion.a.red.electrica
frecuencias1 <- table(datos1)
indices_ordenados <- order(frecuencias1, decreasing = TRUE)
frecuencias1 <- frecuencias1[indices_ordenados]
labels <- names(frecuencias1)
valores <- paste(frecuencias1)
total <- sum(frecuencias1)
proporciones <- frecuencias1 / total * 100
proporciones <- round(proporciones, 2)
porcentajes <- c(labels, proporciones)
porcentajes <- paste(proporciones,"%", sep="")
porcentajes <- paste(labels, "\n", porcentajes)
par(mar = c(2, 2, 2, 2), cex = 0.7)
grafico_red <- pie(x = frecuencias1, 
                      labels = porcentajes, 
                      clockwise = FALSE, 
                      col = c("lightblue", "lightgreen", "pink", "purple"),
                      main = "TIPO DE CONEXIÓN A LA RED ELÉCTRICA EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022")

grafico_red <- mtext("Fuente: Observatorio Villero, 2022",
                 side = 1,
                 line = 0,
                 at = NA,
                 adj = 0,
                 cex = NA)

# Modo: bimodal?
