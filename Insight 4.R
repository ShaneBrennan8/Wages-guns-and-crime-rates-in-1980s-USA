#Step 4.1 Average wages in the south verses the north relent to education plotted on a jitter plot. Wages.csv has already been called in read mode
ggplot(data=Wages[Wages$exp>3 & Wages$exp<50,], pch=40, 
       aes(x=ed, y=lwage, colour=south)) +
  geom_point(alpha=0.7, color = "purple") +
  geom_smooth()

#Step 4.2 To create a boxplot firstly created a subset of wages for south, and for people not in the south south, 
SouthSS<- subset(Wages, south == "yes")
NotSouthSS<- subset(Wages, south == "no")

#Step 4.3 Then I box plot the column lwages which contains the income per person
boxplot(SouthSS$lwage, NotSouthSS$lwage,
        names=c("South", "Not South"),
        main="Income per per capita, South v Not South")

#Step 4.4 Here I take a closer look at the mean income of people in the south verses people not in the south
#I create a subset of the averages income. 
AvgSouthSS<-mean(SouthSS$lwage)
AvgNotSouthSS<-mean(NotSouthSS$lwage)

#Step 4.5 Then I box plot them against each other adding a title label and labels on the x axis.
boxplot(AvgSouthSS, AvgNotSouthSS, names=c("South", "Not South"),
        main="Mean wage per capita, South v Not South")


#Step 4.6 Use of a jitter plot to see the crime rates of the southern states. 
#First I create a subset of just the southern states. 
GunsSouthSS<- subset(Guns, subset = c(state =='Alabama'|state == 'Arkansas'
                                |state == 'District of Columbia'|state =='Florida'
                                |state =='Georgia'|state =='Kentucky'|state =='Louisiana'
                                |state =='Mississippi'|state =='North Carolina'
                                |state =='Oklahoma'|state =='South Carolina'
                                |state =='Tennessee'|state =='Texas'|state =='Virginia'
                                |state =='West Virginia'))

#Step 4.7 Then i plot them but just the values that were obtained for the years 1977 and 1982
ggplot(data=GunsSouthSS[Guns$year>1977 & Guns$year<=1982,], 
       aes(x=year, y=robbery, colour=state)) +
  geom_point(alpha=0.1) +
  geom_smooth()

#Step 4.8 Calculation of the means. First I create another subset from the southern states for the just years between 1977 and 1982
GunsRobbery7782SS <-  subset(GunsSouthSS, subset = c(GunsSouthSS$year > 1977 & GunsSouthSS$year <= 1982))

#Step 4.9 I calculate the mean for the robbery column
mean(GunsRobbery7782SS$robbery)

#Step 4.10 Remove the southern from my dataset and label it as a variable so I can calculcate the average of the non-south states. 
#Firstly, I have to install and call the dplyr package.
install.packages("dplyr")
library(dplyr)

#Step 4.11 Then I remove the Southern states dataframe from the dataset to leave me with just the non-south states, and save it a variable.
GunsNoneSouthSS <- anti_join(Guns, GunsSouthSS)

#Step 4.12 Then I remove all the sample points that aren't between the years 1977 and 1982
GunsRobbery7782NonSouthSS <-  subset(GunsNoneSouthSS, subset = c(GunsNoneSouthSS$year > 1977 & GunsNoneSouthSS$year <= 1982))

#Step 4.13 Then I pass it into the mean function. 
mean(GunsRobbery7782NonSouthSS$robbery)

#Step 4.14
summary(GunsSouthSS)
summary(GunsNoneSouthSS) 
