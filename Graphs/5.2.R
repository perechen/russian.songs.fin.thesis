library(reshape2)
library(ggplot2)
library(scales)

db = read.csv("profile.csv", header=T, sep = ";", na.strings = "")
db = melt(db, id = "Source")

  ggplot(db, aes(variable, value, group = Source, color = Source)) + geom_line(size = 1.4) +
    scale_color_manual(values=c("black", "darkgrey", "lightgrey")) +
    scale_y_continuous(breaks=pretty_breaks(n = 10)) +
    expand_limits(y = 20) +
    theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
    theme(panel.border = element_blank(), axis.line = element_line()) +
    theme(axis.line.x = element_line(color="black", size = 0.5),  axis.line.y = element_line(color="black", size = 0.5)) +
    labs(x = "Икты", y = "%", title = "") +
    theme(axis.text=element_text(size=14), axis.title=element_text(size = 16)) +
    theme(legend.text = element_text(size = 10), legend.title = element_blank())
  
   