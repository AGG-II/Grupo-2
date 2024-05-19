library(readxl)
# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_5.xlsx")
seccion5 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_5 - Hoja 5.csv")
write.csv(seccion5, path_csv, row.names = TRUE)
datos_csv <- read.csv(path_csv)

# Intensidad de la presión del agua con gráfico de barras
datos2 <- datos_csv$Presion
frecuencias1 <- table(datos2)
frecuencias1 <- rev(frecuencias1)

grafico3 <- barplot(frecuencias1, 
                    main = "INTENSIDAD DE LA PRESIÓN DE AGUA\nNORTE DE ARGENTINA, 2022",
                    xlab = "Intensidad en la presión de agua", 
                    ylab = "Frecuencia",
                    yaxt = "n",
                    col = "lightblue")

grafico3 <-mtext("Fuente: Observatorio Villero, 2022",
                 side = 1,
                 line = 4,
                 at = NA,
                 adj = 0,
                 cex = NA)

y_vals <- pretty(table(datos2))
axis(2, at = seq(0, 140, by = 5), las = 1)

# Modo: débil
# Proporciones
total <- sum(frecuencias1)
proporciones <- frecuencias1 / total * 100

