library(ggplot2)
library(scales)
library(reshape2)
library(plyr)

#load file
db = read.csv("RP_data.csv", header=T, sep = ";", na.strings = "", quote = "")

#subset
db1 = subset(db, pub_year > 1799 & pub_year < 1851)

# cutting
lab = as.character(seq(1800, 1845, by = 5))
br = seq(1800, 1850, by = 5)
pesn.period = transform(db1, period = cut(pub_year, breaks = br, labels = lab))

#subset
pesn1 = subset(pesn.period, grepl(paste("песн", collapse = "|"), pesn.period$G_title, ignore.case=T))
rp1 = subset(pesn1, grepl(paste("русская", collapse = "|"), pesn1$G_title, ignore.case=T))

#count
count.pesn = count(pesn1, "period")
count.rp = count(rp1, "period")
count.pesn$rp = count.rp$freq
count.pesn$perc = count.pesn$rp/count.pesn$freq

#plot

ggplot(count.pesn, aes(as.numeric(as.character(period)), perc*100)) + geom_line(size = 1.2) +
  scale_x_continuous(breaks = seq(1800, 1845, by = 5)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
    theme(panel.border = element_blank(), axis.line = element_line()) +
    theme(axis.line.x = element_line(color="black"), axis.line.y = element_line(color="black")) +
  labs(x = "Год", y = "%", title = "") +
  theme(axis.text=element_text(size=14), axis.title=element_text(size = 16)) 



#109/303
#pdf size 5x6
#png size 800x600?

