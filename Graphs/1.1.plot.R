library(ggplot2)
library(reshape2)
library(plyr)

#load file
db = read.csv("RP_data.csv", header=T, sep = ";", na.strings = "", quote = "")

ruscorp = read.csv("Russian_Poetry_genre_years.csv", header=T, sep=";", na.strings = "", quote = "")


#subset
rp1 = subset(db, pub_type == "periodical" & pub_year > 1799 & pub_year < 1851)
rusc = subset(ruscorp, Year > 1799 & Year < 1851)
a = count(rusc$Year)

#plot
ggplot(rp1, aes(pub_year)) + geom_bar() +
  scale_x_continuous(breaks = c(1800, 1810, 1820, 1830, 1840, 1850)) +
  theme_bw() +
  geom_line(data = a, aes(x, freq/10), color = "grey", size = 1.5) + 
  theme(panel.grid.major = element_blank(),
  panel.grid.minor = element_blank()) +
  theme(axis.line.x = element_line(color="black"), axis.line.y = element_line(color="black")) +
  labs(x = "Год", y = "Количество", title = "") +
  theme(axis.text=element_text(size=16), axis.title=element_text(size = 18)) 


