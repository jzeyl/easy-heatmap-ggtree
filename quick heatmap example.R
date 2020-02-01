#import phylogeny
library(ape)
phy<-read.nexus(file.choose())
str(phy)
str(phy[1])

plot(phy$tree_1140)
phy$tree_1140$tip.label

#make dataframe
writeClipboard(phy$tree_1140$tip.label)

#import dataframe
df<-read.csv(file.choose())
str(df)
View(df)

library(ggtree)
library(ggplot2)

p<-ggtree(phy[1], aes()) %<+% df +
  xlim(0,20) +
  #ylim(-10,10) +
  geom_tiplab()
p

#make heatmap, link using rownames
heatmap<-df[2:5]
str(heatmap)
rownames(heatmap)
rownames(heatmap)<-df[,1]

gheatmap(p,heatmap, offset = 5) +
  scale_fill_gradientn(colours = rainbow(5)) 

ggsave("phyloheatmap2.pdf")
getwd()
  

