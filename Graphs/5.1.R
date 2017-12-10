library(ggplot2)
library(plyr)
library(scales)

# ps

db = read.csv("RP_data.csv", header=T, sep = ";", na.strings = "", quote = '')

ps = subset(db, Meter.1 == "Пс" & Year < 1833 & Year > 1799)
ggplot(ps, aes(Year)) + geom_freqpoly(bins = 30, size = 0.8) +
  scale_y_continuous(breaks=pretty_breaks(n = 10)) +
  scale_x_continuous(breaks=pretty_breaks(n = 6)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(panel.border = element_blank(), axis.line = element_line()) +
  theme(axis.line.x = element_line(color="black", size = 0.5),  axis.line.y = element_line(color="black", size = 0.5)) +
  labs(x = "Год", y = "Частотность", title = "") +
  theme(axis.text=element_text(size=16), axis.title=element_text(size = 18)) +
  theme(legend.text = element_text(size = 10))
