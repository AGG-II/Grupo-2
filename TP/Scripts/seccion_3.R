#Leo los datos del archivo
datos_csv <- read.csv("C:/Users/ignac/OneDrive/Escritorio/Graficas/Seccion_3 - Hoja 1.csv")


#Cantidad de personas por dormitorio con Grafico de bastones
datos <- datos_csv$Cantidad.de.personas.por.dormitorio
frecuencias <- table(datos)
grafico <-plot(frecuencias,type = "h", main = "Cantidad de personas por dormitorio",
                xlab = "Cantidad de personas", ylab = "Frecuencia", 
                col = "blue")
grafico <-mtext("Fuente: Observatorio villero",side = 1,line = 4, at = NA,adj = 0,cex = NA)

tabla_resumen <- data.frame(Cantidad_de_Personas_por_dormitorio = as.numeric(names(frecuencias)), Frecuencia = as.numeric(frecuencias))



