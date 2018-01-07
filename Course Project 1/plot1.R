#plot1.R: Generacion Histograma Global Active Power

#Lee datos fichero household_power_consumption.txt
datos <- read.table("/Users/juanreyesduran/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datos_EneFeb <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

#Extrae Datos Global Active Power
GlobalActivePower <- as.numeric(datos_EneFeb$Global_active_power)

#Configura PNG Device
png("plot1.png", width=480, height=480)

#Genera Histograma
hist(GlobalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#Cierra PNG Device
dev.off()
