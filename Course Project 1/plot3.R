#plot3.R: Generacion Plot Energy Submeterig 1,2 y 3

#Lee datos fichero household_power_consumption.txt
datos <- read.table("/Users/juanreyesduran/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datos_EneFeb <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

#Extrae Datos Energy Submeterig 1,2 y 3
Metering_1 <- as.numeric(datos_EneFeb$Sub_metering_1)
Metering_2 <- as.numeric(datos_EneFeb$Sub_metering_2)
Metering_3 <- as.numeric(datos_EneFeb$Sub_metering_3)
datos_EneFeb_Time <- strptime(paste(datos_EneFeb$Date, datos_EneFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datos_EneFeb_Time, Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datos_EneFeb_Time, Metering_2, type="l", col="red")
lines(datos_EneFeb_Time, Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Cierra PNG Device
dev.off()
