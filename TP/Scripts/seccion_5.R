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
                    main = "INTENSIDAD DE LA PRESIÓN DE AGUA EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022",
                    xlab = "Intensidad en la presión de agua", 
                    ylab = "Cantidad de viviendas",
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

# Compra de agua embotellada con gráfico de sectores circulares

datos1 <- datos_csv$Compra.agua.embotellada
frecuencias2 <- table(datos1)

indices_ordenados <- order(frecuencias2, decreasing = TRUE)
frecuencias2 <- frecuencias2[indices_ordenados]
labels <- names(frecuencias2)
valores <- paste(frecuencias2)
total <- sum(frecuencias2)
proporciones <- frecuencias2 / total * 100
proporciones <- round(proporciones, 2)
porcentajes <- c(labels, proporciones)
porcentajes <- paste(proporciones,"%", sep="")
porcentajes <- paste(labels, "\n", porcentajes)
par(mar = c(2, 2, 2, 2), cex = 0.7)
grafico_red <- pie(x = frecuencias2, 
                   labels = porcentajes, 
                   clockwise = FALSE, 
                   col = c("lightblue","lightgreen"),
                   main = "COMPRA DE AGUA EMBOTELLADA EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022")

grafico_red <- mtext("Fuente: Observatorio Villero, 2022",
                     side = 1,
                     line = 0,
                     at = NA,
                     adj = 0,
                     cex = NA)

# Capacidad de almacenamiento de agua en altura con gráfico de barras

datos3 <- datos_csv$Litros.del.tanque

datos3_filtrado <- datos3[!datos3 %in% ""]
frecuencias3 <- table(datos3_filtrado)
frecuencias_df <- as.data.frame(frecuencias3)

colnames(frecuencias_df) <- c("Value", "Frequency")
custom_order <- c("Menos de 200 lts", "200 a 500 lts", "Más de 500 lts") 
custom_order <- custom_order[custom_order %in% frecuencias_df$Value]
frecuencias_df$Value <- factor(frecuencias_df$Value, levels = custom_order)
ordered_frecuencias_df <- frecuencias_df[order(frecuencias_df$Value), ]
#ordered_frecuencias_df <- rev(ordered_frecuencias_df)

grafico4 <- barplot(ordered_frecuencias_df$Frequency, 
                    names.arg = ordered_frecuencias_df$Value, 
                    main = "CAPACIDAD DE ALMACENAMIENTO DE AGUA (EN ALTURA) EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022",
                    ylab = "Cantidad de viviendas", 
                    xlab = "Capacidad de almacenamiento",
                    yaxt = "n",
                    col = "lightblue",
                    horiz = F)

grafico4 <-mtext("Fuente: Observatorio Villero, 2022",
                 side = 1,
                 line = 4,
                 at = NA,
                 adj = 0,
                 cex = NA)

axis(2, at = seq(0, 60, by = 5))

# Modo: 200 a 500 lts
# Proporciones (Sin contar los que  no tienen tanque de agua)
total <- sum(frecuencias3)
proporciones <- frecuencias3 / total * 100
proporciones


