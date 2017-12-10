library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(scales)

db = read.csv("kolcov_4.1_blank.data.verse.csv", header=T, sep = ";", na.strings = "", quote = '')
rhyme = db[,-5]
rhyme.sum = aggregate(. ~ year, rhyme, sum)

rhyme.per = rhyme.sum
rhyme.per$per = rhyme.sum$no_rhm / rhyme.sum$total
rhyme.test = rhyme.per[,-(4:5)]
rhyme.test = melt(rhyme.test, id = "year")

ggplot(rhyme.test, aes(year)) +
  geom_area(aes(y = value, fill = variable, group = variable), alpha = 0.7) +
  scale_fill_manual(breaks = c("rhm", "no_rhm"), labels=c("Рифмованные", "Белые"), values =c("#a9a9a9", "#5e5e5e")) +
  labs(x = "Год", y = "Кол-во стихов", title = "", fill = "") +
  scale_y_continuous(breaks=pretty_breaks(n = 10)) +
  scale_x_continuous(breaks=pretty_breaks(n = 20)) +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  theme(panel.grid.minor = element_blank()) +
  theme(panel.border = element_blank(), axis.line = element_line()) +
  theme(axis.line.x = element_line(color="black", size = 0.5), axis.text.x=element_text(vjust = 0.3),  axis.line.y = element_line(color="black", size = 0.5)) +
  theme(axis.text=element_text(size=13), axis.title=element_text(size = 18)) +
  theme(legend.text = element_text(size = 18), plot.title = element_text(size=18)) +
  annotate("segment", x = 1830, xend = 1830, y = 0, yend = 700, colour = "black", size = 0.5, linetype = 2) +
  annotate("text", x = 1833.2, y = 680, label = "\"Русские песни\" Мерзлякова (1830)", size = 4) +
  annotate("text", x = 1831.8, y = 650, label = "и Дельвига (1829)", size = 4) +
  annotate("segment", x = 1835, xend = 1835, y = 0, yend = 600, colour = "black", size = 0.5, linetype = 2) +
  annotate("text", x = 1838.3, y = 580, label = "\"Стихотворения Кольцова\" (М., 1835)", size = 4) +
  annotate("segment", x = 1838, xend = 1838, y = 0, yend = 300, colour = "black", size = 0.5, linetype = 2) +
  annotate("text", x = 1840, y = 280, label = "Белинский - редактор", size = 4)

