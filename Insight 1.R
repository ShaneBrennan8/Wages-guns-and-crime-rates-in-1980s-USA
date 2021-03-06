#Step 1.1 Import my guns dataset in read mode so I can do some analysis. Note I chose to import it in read mode as I do not intend to edit the actual dataset in the local drive.
Guns <- read.csv("Guns.csv", head=TRUE, sep=",")

#Step 1.2 First I use the subset function to select the columns and rows I want. In this case it's the columns year and violent with the rows 1 to 23 corresponding to the state Alabama
GunsDF1Al <- data.frame(Guns[c(1:23), c("year","male")])
GunsDF2Al <- data.frame(Guns[c(1:23), c("year","violent")])

#Step 1.3 Import and call ggplot
install.packages("ggplot2")
library(ggplot2)

#Step 1. 4 I then use the ggplot function to plot the dataframe and label X , Y axis in order to visualize the data.
#I stored it as a variable to call below.
GunsDF1AlGGplot = ggplot(data=GunsDF1Al,
       aes(x=year, y=male)) +
  geom_point(alpha=5) +
  geom_smooth()

GunsDF2AlGGplot = ggplot(data=GunsDF2Al,
       aes(x=year, y=violent)) +
  geom_point(alpha=5) +
  geom_smooth()


#Step 1.5 When displaying the plot I also inserted a title.
print(GunsDF1AlGGplot + ggtitle ("Make up of males(10-29) in Alabama 1977 - 1999"))
print(GunsDF2AlGGplot + ggtitle ("Violent crime incidents per 100k Alabama 1977 - 1999"))

#Step 1.6 Here I just a 15 year period in Alabama so I create that subset, create the ggplot, and call the graph with a specified title
GunsDF2Al15YearPeriod <- data.frame(Guns[c(1:16), c("year","violent")])

GunsDF2AlGGplot15YP = ggplot(data=GunsDF2Al15YearPeriod,
                             aes(x=year, y=violent)) + geom_point(alpha=10) +
  geom_smooth()

print(GunsDF2AlGGplot15YP + ggtitle ("Violent crime incidents per 100k Alabama 1977 - 1992"))

#Steps 1.7 I follow steps which are very similar to the above but I do it with the data that relates to Georgia.
#Note that I changed the row number to the corresponding row in my dataset
GunsDF1Ga <- data.frame(Guns[c(231:253), c("year","male")])
GunsDF2Ga <- data.frame(Guns[c(231:253), c("year","violent")])

GunsDF1GaGGplot = ggplot(data=GunsDF1Ga,
       aes(x=year, y=male)) +
  geom_point(alpha=5) +
  geom_smooth()

GunsDF2GaGGplot = ggplot(data=GunsDF2Ga,
       aes(x=year, y=violent)) +
  geom_point(alpha=5) +
  geom_smooth()

print(GunsDF1GaGGplot + ggtitle ("Make up of males(10-29) in Georgia 1977 - 1999"))
print(GunsDF2GaGGplot + ggtitle ("Vionent crime incidents per 100k Georgia 1977 - 1999"))

# Step 1. 8 I follow the same steps as above but this time my subject is Idaho so I am using the rows that pertain to that State. 
GunsDF1Id <- data.frame(Guns[c(277:299), c("year","male")])
GunsDF2Id <- data.frame(Guns[c(277:299), c("year","violent")])

GunsDF1IdGGplot = ggplot(data=GunsDF1Id,
       aes(x=year, y=male)) +
  geom_point(alpha=5) +
  geom_smooth()
print(GunsDF1IdGGplot + ggtitle ("Make up of males(10-29) in Idaho 1977 - 1999"))

GunsDF2IdGGplot = ggplot(data=GunsDF2Id,
       aes(x=year, y=violent)) +
  geom_point(alpha=5) +
  geom_smooth()
print(GunsDF2IdGGplot + ggtitle ("Vionent crime incidents per 100k Idaho 1977 - 1999"))


#Steps 1.9 To find the minimum and maximum rates of crime Between 1997-1999
min(GunsDF2Id[["violent"]])
max(GunsDF2Id[["violent"]])

#Steps 1.10 Here we apply the linear model function on each state to determine the linear regression.
#The dataframes were already created above in previous steps. 
maleModelId <- lm(male ~ year, data = GunsDF1Id)
maleModelId

maleModelAl <- lm(male ~ year, data = GunsDF1Al)
maleModelAl

maleModelGa <- lm(male ~ year, data = GunsDF1Ga)
maleModelGa

#Steps 1.10 National level
GunsNationally = ggplot(data=Guns,
                        aes(x=year, y=violent)) +
  geom_point(alpha=5) +
  geom_smooth()
print(GunsNationally + ggtitle ("National level of violent crimes per 100k 1977 - 1999")) 
