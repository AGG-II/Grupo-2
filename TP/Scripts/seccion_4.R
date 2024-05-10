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

fuente = "Fuente: Observatorio villero"

#Propiedad de la vivienda con Grafico de barras 
frecuencias1 <- table(El.lugar.que.habitan.es.)
indices_ordenados <- order(frecuencias1, decreasing = TRUE)
frecuencias1 <- frecuencias1[rev(indices_ordenados)] # confirmar esto
names(frecuencias1) <- rev(c("Prop. sin tít.", "Prop. con comprob.", "Tomado", "Otro", "Prestado", "Alquilado"))

grafico3 <- barplot(frecuencias1, main = "PROPIEDAD DE LA VIVIENDA\nNORTE DE ARGENTINA, 2022", ylab = "Propiedad sobre la vivienda", xlab = "Frecuencia",col = "lightblue", horiz = TRUE)
grafico3 <-mtext(fuente,side = 1,line = 4, at = NA,adj = 0,cex = NA)
tabla_resumen <- data.frame(Propiedad_de_la_vivienda = names(frecuencias1), Frecuencia = as.numeric(frecuencias1))
print(tabla_resumen)

#Existencia de contrato de alquiler firmado con Grafico de sectores circulares 
'''
par(mar = c(2, 2, 2, 2), cex = 0.7)
grafico_torta <- pie(x = xA, labels = porcentajes, clockwise = FALSE, main = "PRINCIPAL SIGNO VISIBLE EN PACIENTES CON ANOREXIA\nARGENTINA, OCTUBRE 2012")
mtext(text = fuente, side = 1, line = 0, adj = 0, cex = 0.5)
'''

#Costo actual del alquiler con Histograma
costo_alquiler<- Costo.actual
grafico1 <- hist(costo_alquiler,main = "COSTO DEL ALQUILER\nNORTE DE ARGENTINA, 2022", xlab = "Costo del alquiler en pesos", ylab = "Frecuencia", xlim = c(floor(min(costo_alquiler)), ceiling(max(costo_alquiler))), breaks = seq(floor(min(costo_alquiler)), ceiling(max(costo_alquiler)), by = 1), xaxt = "n", col = "purple")
grafico1 <-mtext(fuente,side = 1,line = 4, at = NA,adj = 0,cex = NA)
axis(1, at = seq(floor(min(data1)), ceiling(max(data1)), by = 1))
y_vals <- pretty(table(data1))
axis(2, at = seq(min(y_vals), max(y_vals), by = 1))


#Porcentaje de aumento del alquiler el último año con Histograma