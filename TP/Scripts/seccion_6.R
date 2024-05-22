library(readxl)
# cargo el path actual
path_actual <- getwd()
#Leo los datos del archivo
path_xlsx <- file.path(path_actual, "TP", "Secciones", "xlsx", "Seccion_6.xlsx")
seccion7 <- read_xlsx(path_xlsx)

path_csv <- file.path(path_actual, "TP", "Secciones", "csv", "Seccion_6 - Hoja 1.csv")
write.csv(seccion7, path_csv, row.names = TRUE)
datos_csv <- read.csv(path_csv)

fuente = "Fuente: Observatorio Villero, 2022"

# Tipos de calefacción en las distintas casas
datos <- datos_csv$X.Cuál.es.la.principal.fuente.de.energía.que.utiliza.para.calefaccionar.la.vivienda.
frecuencias <- table(datos)
datos1 <- datos_csv$...3
frecuencias1 <- table(datos1)
datos2 <- datos_csv$...4
frecuencias2 <- table(datos2)
datos3 <- datos_csv$...5
frecuencias3 <- table(datos3)
datos4 <- datos_csv$...6
frecuencias4 <- table(datos4)
datos5 <- datos_csv$...7

vector <- c(frecuencias1,frecuencias2,frecuencias3,frecuencias4)
total <- length(datos1)
proporciones <- vector / total * 100
round(proporciones, 2)
proporciones <- sort(proporciones, decreasing = TRUE)
grafico3 <- barplot(proporciones, 
                    main = "TIPOS DE CALEFACCIÓN EN LAS VIVIENDAS EN BARRIOS POPULARES\nNORTE DE ARGENTINA, 2022",
                    xlab = "Tipos de calefacción", 
                    ylab = "Porcentaje de hogares",
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

