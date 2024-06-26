library(readxl)
# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_11.xlsx")
seccion11 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_11 - Hoja 1.csv")
write.csv(seccion11, path_csv, row.names = TRUE)
datos_csv <- read.csv(path_csv)

# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_10.xlsx")
seccion10 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_10 - Hoja 1.csv")
write.csv(seccion10, path_csv, row.names = TRUE)
datos2_csv <- read.csv(path_csv)

fuente = "Fuente: Observatorio Villero, 2022"

# Análisis bivariado: Relación entre la distancia a basurales y la presencia de plagas en la vivienda y sus alrededores
# con gráfico de barras subdivididas
datos1 <- datos_csv$Basurales.cerca
frecuencias1 <- table(datos1)

datos5 <- datos2_csv$Plagas
frecuencias5 <- table(datos5)
# Proporciones
total <- sum(frecuencias5)
proporciones <- frecuencias5 / total * 100
round(proporciones, 2)

data <- data.frame(distancia = datos1, plagas = datos5)
tabla_contingencia <- table(data$distancia, data$plagas)
matriz <- as.matrix(tabla_contingencia)
matriz[c(1, 3), ] <- matriz[c(3, 1), ]
matriz[, c(1, 2)] <- matriz[, c(2, 1)]
matriz <- prop.table(matriz, margin = 1) * 100
matriz <- round(matriz, 2)

rownames(matriz)[3] <- "A más de 2 km"
rownames(matriz)[2] <- "Entre 500 m y 2 km"
rownames(matriz)[1] <- "A menos de 500 m"
colnames(matriz)[1] <- "Con plagas"
colnames(matriz)[2] <- "Sin plagas"

par(mar = c(5, 4, 4, 8), xpd = TRUE)
grafico3 <- barplot(t(matriz),
                    beside = FALSE,
                    main = "RELACIÓN ENTRE LA DISTANCIA A BASURALES Y LA PRESENCIA DE PLAGAS EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022",
                    xlab = "Distancia a basurales", 
                    ylab = "Porcentaje de viviendas",
                    yaxt = "n",
                    legend.text = FALSE, 
                    col = c("lightgreen", "lightblue"))

grafico3 <-mtext("Fuente: Observatorio Villero, 2022",
                 side = 1,
                 line = 4,
                 at = NA,
                 adj = 0,
                 cex = NA)

y_vals <- pretty(table(datos5))
axis(2, at = seq(0, 100, by = 20), las = 1)

legend("topright", 
       inset = c(-0.1, 0), 
       legend = colnames(matriz), 
       fill = c("lightgreen", "lightblue"), 
       cex = 0.75, 
       text.width = 0.25)

