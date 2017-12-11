library(stylo)

stylo(corpus.lang = "Other", mfw.min = 10, mfw.max = 200, mfw.incr = 20,
      culling.min = 0, culling.max = 100, culling.incr = 50,
      analysis.type = "BCT",
      sampling = "random.sampling", sample.size = 10000, number.of.samples = 3)
