#plot2.R: Plot Global Active Power

#Lee datos fichero household_power_consumption.txt
datos <- read.table("/Users/juanreyesduran/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datos_EneFeb <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

#Extrae Datos Global Active Power
datos_EneFeb_Time <- strptime(paste(datos_EneFeb$Date, datos_EneFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(datos_EneFeb$Global_active_power)

#Configura PNG Device
png("plot2.png", width=480, height=480)

#Genera Grafico
plot(datos_EneFeb_Time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Cierra PNG Device
dev.off()
