#READ AND FORMAT DATA
data<-read.delim('testweek1.txt', sep = ';', stringsAsFactors = FALSE)
data$Date<-as.Date(data$Date, '%d/%m/%Y')
df<-subset(data, data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02' ))

# PLOT 1
df$Time<-strptime(df$Time, format='%H:%M:%S')
df$hour<-as.numeric(format(df$Time, format='%H'))
df[,3]<-as.numeric(df[,3])
hist(df[,3], main=’Global Active Power’, xlab=’Global Active Power (klw)’, col=’red’)

# PLOT 2
df$Wday<-paste(df$Date, df$Time, sep=" ")
df$Wday<- strptime(df$Wday, format = "%Y-%m-%d %H:%M:%S")
plot(df$Wday, df[,3], type= "l", ylab="Global Active Power (kilowatts)")


#PLOT 3
plot(df$Wday, df[,7], type= "l", ylab="Energy Submetering")
lines(df$Wday, df[,8], type="l", col='red')
lines(df$Wday, df[,9], type="l", col='blue')
legend('topright', c('Sub 1','Sub 2', 'Sub 3'), col=c('black','red','blue'), lty=1, lwd=2.5)

#PLOT 4
par(mfrow=c(2,2), mai=c(1,0.1,0.1,0.1))
plot(df$Wday, df[,3], type= "l", xlab='',ylab="Global Active Power (kilowatts)")
plot(df$Wday, as.numeric(df[,5]), type= "l", ylab="VOltage")
plot(df$Wday, df[,7], type= "l", ylab="Energy Submetering")
lines(df$Wday, df[,8], type="l", col='red')
lines(df$Wday, df[,9], type="l", col='blue')
legend('topright', c('Sub 1','Sub 2', 'Sub 3'), col=c('black','red','blue'), lty=1, lwd=2.5)
plot(df$Wday, as.numeric(df[,4]), type= "l", ylab="Global reactive power")

