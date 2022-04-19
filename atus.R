org = read.csv("G:/내 드라이브/atussum.csv")
data = read.csv(file.choose())

View(data)



data = read.csv("G:/My Drive/atussum.csv")
#change day into factor and label them 

data$tudiaryday <-factor(data$tudiaryday, 
                         levels= c(1,2,3,4,5,6,7), 
                         labels = c('Sunday','Monday','Tuesday','Wednesday',
                                    'Thursday','Friday','Saturday'))
head(data$tudiaryday)




######calculate weighted average of sleeping time. 
denom = aggregate(data$tufnwgtp, by=list(data$tudiaryday), FUN=sum) #sum of weight
x = aggregate(data$t010101*data$tufnwgtp, by = list(data$tudiaryday), FUN=sum) #sum of sleep time*weight

data.frame(Day_of_week = c('Sunday','Monday','Tuesday','Wednesday',
             'Thursday','Friday','Saturday'),(x[2]/denom[2])) #average sleeping time incorporating weight



#load data
data = read.csv("G:/My Drive/atussum.csv")

#1-1 Weekly average sleeping time 
aggregate(data$t010101, by =list(data$tudiaryday), FUN = mean) 

#1-2 compare average sleeping time with or without weight 
sum(data$t010101*data$tufnwgtp)/sum(data$tufnwgtp) #with weight
mean(data$t010101) #without weight 


#2-1 Weekly average Tv watching Time  
aggregate(data$t120303, by =list(data$tudiaryday), FUN = mean) 


#2-2compare average tv watching time with or without weight 
sum(data$t120303*data$tufnwgtp)/sum(data$tufnwgtp) #with weight
mean(data$t120303) #without weight 


sum(data$tufnwgtp)
options(scipen=1000)

data$telfs<-factor(data$telfs)
######calculate weighted average of sleeping time. 
denom2 = aggregate(data$tufnwgtp, by=list(data$telfs), FUN=sum) #sum of weight
x2 = aggregate(data$t120303*data$tufnwgtp, by = list(data$telfs), FUN=sum) #sum of sleep time*weight
x2[2]/denom2[2]
data.frame(Day_of_week = c('Sunday','Monday','Tuesday','Wednesday',
                           'Thursday','Friday','Saturday'),(x2[2]/denom2[2])) #average sleeping time incorporating weight


######calculate weighted average of sleeping time. 
denom2 = aggregate(data$tufnwgtp, by=list(data$telfs), FUN=sum) #sum of weight
x2 = aggregate(data$t010101*data$tufnwgtp, by = list(data$telfs), FUN=sum) #sum of sleep time*weight
x2[2]/denom2[2]

#calcuate without weight 
aggregate(data$t120303, by =list(data$telfs), FUN = mean) #average sleeping without considering weight


#compare total average
sum(data$t120303*data$tufnwgtp)/sum(data$tufnwgtp)
mean(data$t120303)


summary(data$telfs)

outside = data[data$telfs == '3', ]

denome = aggregate(outside$tufnwgtp,by = list(outside$tudiaryday), FUN=sum) #sum of weight
xe = aggregate(outside$t010101*outside$tufnwgtp, by = list(outside$tudiaryday), FUN=sum) #sum of sleep time*weight
xe[2]/denome[2]
