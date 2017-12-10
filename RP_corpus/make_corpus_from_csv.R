install.packages("gtools")
library(gtools)

# read metadata table and get/override existing) path connection to each text

db = read.csv("RP_data.csv", header=T, sep = ";", quote = "", na.strings = "")
files = list.files(path = "corpus_split/", full.names = T, all.files = F)
files = mixedsort(files)
files
db$path = files

# subsetting

db_core = subset(db, Type == "core")

# conjure stacked corpus

output_corpora<-""
for (i in 1:length(db$path)) {
  poem = scan(db$path[i], what = "character", sep = "\n", blank.lines.skip=F)
  poem = paste(poem, collapse = "\n")
  output_corpora = paste(output_corpora, poem, sep = "\n\n")
  print(db$path[i])
}

# write corpus on disk

writeLines(output_corpora,"RP_all_nonlemm.txt", sep = "\n")
