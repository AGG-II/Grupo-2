library(readxl)
# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_10.xlsx")
seccion10 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_10 - Hoja 1.csv")
write.csv(seccion10, path_csv, row.names = TRUE)
datos_csv <- read.csv(path_csv)

fuente = "Fuente: Observatorio Villero, 2022"

# Plagas presentes en las viviendas y alrededores
datos1 <- datos_csv$X.Cuáles.plagas.
frecuencias1 <- table(datos1)
datos2 <- datos_csv$...4
frecuencias2 <- table(datos2)
datos3 <- datos_csv$...5
frecuencias3 <- table(datos3)

vector <- c(frecuencias2, frecuencias1, frecuencias3)
# Proporciones
total <- sum(vector)
proporciones <- vector / total * 100
round(proporciones, 2)

grafico3 <- barplot(proporciones, 
                    main = "PRESENCIA DE PLAGAS EN LAS VIVIENDAS EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022",
                    xlab = "Plagas presentes en las viviendas", 
                    ylab = "Porcentaje de hogares que presentan una plaga",
                    #horiz = TRUE,
                    yaxt = "n",
                    las = 1,
                    col = "lightblue")

grafico3 <-mtext("Fuente: Observatorio Villero, 2022",
                 side = 1,
                 line = 4,
                 at = NA,
                 adj = 0,
                 cex = NA)

y_vals <- pretty(table(datos2))
axis(2, at = seq(0, 50, by = 5), las = 1)

