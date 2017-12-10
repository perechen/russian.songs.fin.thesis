library(ggplot2)
library(reshape2)
library(scales)

db = read.csv("kolcov_4.2_rp.vs.pesni.csv", header=T, sep = ";", na.strings = "")
kolcov = melt(db, id = "year")

ggplot(kolcov, aes(year, value, group = variable)) +
  geom_line(aes(linetype = variable), size = 1) +
  scale_linetype_discrete(breaks = c("russian_song", "song"),labels = c("Русская песня", "Песня...")) +
  scale_y_continuous(breaks=pretty_breaks(n = 10)) +
  scale_x_continuous(breaks=pretty_breaks(n = 20)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(panel.border = element_blank(), axis.line = element_line()) +
  theme(axis.line.x = element_line(color="black", size = 0.5), axis.text.x=element_text(angle = 30, vjust = -0),  axis.line.y = element_line(color="black", size = 0.5)) +
  labs(x = "Год", y = "Количество", title = "", linetype = "") +
  theme(axis.text=element_text(size=14), axis.title=element_text(size = 14)) +
  theme(legend.text = element_text(size = 10))
  
