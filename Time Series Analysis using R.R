#creating a dataframe from our dataset
mydata=read.csv("C:/Users/Admin/OneDrive/Desktop/CSV/R/opsd_germany_daily.txt",header=TRUE,row.names = "Date")
mydata

#viewing data in tabular format
View(mydata)

#looking at part of dataframe using head() or tail()
head(mydata,5)

tail (mydata,5)

#Retrieve the dimension of t=object
dim(mydata)

#check datatype of each column in dataframe
str(mydata)

#looking at date column( will not show data as its index)
head(mydata$Date)

#looking at row names(indexes)
row.names(mydata)

#accessing a specific row
mydata["2006-01-01",]
mydata["2017-08-10",]

#accessing multiple rows
mydata[c("2006-01-01","2006-01-04"),]

summary(mydata)


#without parsing date column
mydata2=read.csv("C:/Users/Admin/OneDrive/Desktop/CSV/R/opsd_germany_daily.txt",header=TRUE)
mydata2

#now look at date column
str(mydata2$Date)


#convert it into date format
x=as.Date(mydata2$Date)
head(x)
class(x)
str(x)

#create year, month, day columns
year<-as.numeric(format(x,'%y'))
head(year)

month=as.numeric(format(x,'%m'))
head(month)

day=as.numeric(format(x,'%d'))
head(day)

head(mydata2)


#add columns to the existing dataframe
mydata2= cbind(mydata2,year,month,day)
head(mydata2)
tail(mydata2)
mydata2[1:3,]
head(sample(mydata2,8))


#let's create a line plot of the full time series of Germany's
#daily electricity consumption, using the Data Frame's plot() method.
#using plot()
#option1:
plot(mydata2$year,mydata2$Consumption,type="l",xlab="year",ylab="consumption")

#option 2:
plot(mydata2$year,mydata2$consumption,type='l',xlab="year",ylab="consumption",lty=1,ylim=c(800,1700),xlim=c(2006,2018))
#better options
#option 3:
#for one plot/window
par(mfrow=c(1,1))
plot(mydata2[,2])

#option 4:
plot(mydata2[,2],xlab="year",ylab="Consumption")
plot(mydata2[,2],xlab="year",ylab='Consumption', type="l",lwd=2,col="blue")
plot(mydata2[,2],xlab="Year",ylab="Consumption",type="l",lwd=2,xlim=c(0,2018))
plot(mydata2[,2],xlab="year",ylab="consumption",type="l",lwd=2,xlim=c(2006,2018))
plot(mydata2[,2],xlab="year",ylab="Consumption",type="l",lwd=2,xlim=c(2006,2018),ylim=c(900,2000),main='Consumption Graph')
plot(mydata2$Consumption,xlab="year",ylab="Consumption",type="l",lwd=2,xlim=c(2006,2018),ylim=c(900,2000),main='Consumption Graph')#same as above query but with syntax difference


#taking log values of consumption & take difference of logs
plot(10*diff(log(mydata2[,2])),xlab="year",ylab="consumption",type="l",lwd=2,ylim=c(-5,5),main="COnsumption Graph",col="orange")


#using ggplot()
install.packages("ggplot2")
library(ggplot2)

#option1
ggplot(mydata2,type="o")+geom_line(aes(x=year,y=Consumption))

#option 2:
ggplot(data=mydata2,aes(x=year,y=Consumption, group=1))+geom_line(linetype="dashed")+geom_point()
ggplot(data=mydata2,mapping=aes(x=year,y=Consumption,col="red"))+geom_point()
#we can see that the plot() (method has chosen pretty good tick locations
#(every two years) & labels (the years) for the x-axis, which is helpful.
#however with so many data points, the line plot is crowded & hard to read.
#this we can go with plot()
#plot the data considering the solar & wind time series too.

mydata2
#wind column
min(mydata2[,3],na.rm=T)
max(mydata2[,3],na.rm=T)

#Consumption column
min(mydata2[,4],na.rm=T)
max(mydata2[,4],na.rm=T)

#Solar
min(mydata2[,5],na.rm=T)
max(mydata2[,5],na.rm=T)

#wind+solar
min(mydata2[,6],na.rm=T)
max(mydata2[,6],na.rm=T)

#for multiple plots
par(mfrow=c(3,1))

#or

plot1=plot(mydata2[,2],xlab="year",ylab='Daily Tools(GWh)',type="l",
           lwd=2,main="Consumption",col="orange",ylim=c(840,1750))

plot1<-plot(mydata2[,1],mydata_3[,2],xlab = "year",ylab="Daily Totals (GWH)",type="l",
            lwd=2,main="Consumption",col="orange",ylim=c(840,1750))


#test
plot2<-plot(mydata2[,4],xlab = "year",ylab ="Daily Totals (GWH)",type = "l",
            main = "Solar",ylim = c(0,500),col="blue")

plot2<-plot(mydata2[,1],mydata_3[,2],xlab = "year",ylab ="Daily Totals (GWH)",type = "l",
            main = "Solar",ylim = c(0,500),col="blue")
plot3<-plot(mydata2[,3],xlab = "year",ylab ="Daily Totals (GWH)",type = "l",
            lwd=2,main = "Wind",ylim = c(0,900),col="red")

plot3<-plot(mydata2[,1],mydata_3[,3],xlab = "year",ylab ="Daily Totals (GWH)",type = "l",
            lwd=2,main = "Wind",ylim = c(0,900),col="red")



#let?s plot time series in a single year to investigate further
str(mydata2)
x<-as.Date(mydata2$Date)
head(x)
class(x)
str(x)

#to convert date column into date format
MDYdate<-as.Date(x,format="%m/%d/%Y")

str(MDYdate)

mydata3<-cbind(MDYdate,mydata2)
head(MDYdate)

head(mydata3)
str(mydata3)

#look at the specific data
mydata3<-subset(mydata3,subset=mydata3$MDYdate>='2017-01-01'&mydata3$MDYdate<='2017-12-31')




