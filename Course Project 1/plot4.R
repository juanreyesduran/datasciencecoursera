#plot4.R: Generacion Plot: Global Active Power; Volage; Energy Submeterig; y Global Reactive Power

#Lee datos fichero household_power_consumption.txt
datos <- read.table("/Users/juanreyesduran/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datos_EneFeb <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

#Extrae Datos relacionados con los 4 conceptos: 
#       Global Active Power; Volage; Energy Submeterig; y Global Reactive Power
GlobalActivePower <- as.numeric(datos_EneFeb$Global_active_power)
GlobalReactivePower <- as.numeric(datos_EneFeb$Global_reactive_power)
Voltage <- as.numeric(datos_EneFeb$Voltage)
Metering_1 <- as.numeric(datos_EneFeb$Sub_metering_1)
Metering_2 <- as.numeric(datos_EneFeb$Sub_metering_2)
Metering_3 <- as.numeric(datos_EneFeb$Sub_metering_3)
datos_EneFeb_Time <- strptime(paste(datos_EneFeb$Date, datos_EneFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Configura PNG Device
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

#Genera Graficos
plot(datos_EneFeb_Time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datos_EneFeb_Time, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datos_EneFeb_Time, Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datos_EneFeb_Time, Metering_2, type="l", col="red")
lines(datos_EneFeb_Time, Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datos_EneFeb_Time, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")


#Cierra PNG Device
dev.off()
