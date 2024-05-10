#Leo los datos del archivo
datos_csv <- read.csv("C:/Users/ignac/OneDrive/Escritorio/Graficas/Seccion_1 - Hoja 1.csv")

#Edad del jefe del hogar con histograma
data1<- datos_csv$Edad.del.jefe.del.hogar
grafico1 <- hist(data1,main = "Edad del jefe del hogar", xlab = "Edad", ylab = "Frecuencia", xlim = c(floor(min(data1)), ceiling(max(data1))), breaks = seq(floor(min(data1)), ceiling(max(data1)), by = 1), xaxt = "n", col = "purple")
grafico1 <-mtext("Fuente: Observatorio villero",side = 1,line = 4, at = NA,adj = 0,cex = NA)
axis(1, at = seq(floor(min(data1)), ceiling(max(data1)), by = 1))
y_vals <- pretty(table(data1))
axis(2, at = seq(min(y_vals), max(y_vals), by = 1))



#Tiempo de residecia en la vivienda con Grafico de bastones
datos1 <- datos_csv$Tiempo.de.residencia.en.la.vivienda
frecuencias <- table(datos1)
grafico2 <-plot(frecuencias,type = "h", main = "Gráfica de Educacíón",
     xlab = "Nivel educativo", ylab = "Frecuencia", 
     col = "pink")
grafico2 <-mtext("Fuente: Observatorio villero",side = 1,line = 4, at = NA,adj = 0,cex = NA)


#Cantidad de integrantes en la vivienda con tabla y con Grafico de barras 
datos2 <- datos_csv$Cantidad.de.integrantes
frecuencias1 <- table(datos2)
grafico3 <- barplot(frecuencias1, main = "Cantidad de integrantes en la vivienda", xlab = "Cantidad de integrantes", ylab = "Frecuencia",col = "lightblue")
grafico3 <-mtext("Fuente: Observatorio villero",side = 1,line = 4, at = NA,adj = 0,cex = NA)
tabla_resumen <- data.frame(Cantidad_de_Integrantes = as.numeric(names(frecuencias1)), Frecuencia = as.numeric(frecuencias1))
print(tabla_resumen)



        