# The data was downloaded from: http://www.gob.mx/cre/articulos/precios-maximos-de-combustibles-enero?idiom=es


library(shiny)
library(plotly)
library(ggplot2)
library(ggrepel)
dir()

#setwd("~/Dropbox/GitHub/GasolinaPrice/")


TablaH <- read.csv("PriceFuel.csv", header = T, sep = "," , dec = ".")
dim(TablaH)
summary(TablaH)
#summary(TablaH$Mountain)
#Mount_Cont <- paste(TablaH$Mountain, TablaH$Coutry.ID, sep = "-")
#Mount_Cont
#TablaH <- data.frame(TablaH, Mount_Cont)
#TablaH$Continent
#TablaH$Range

#names(TablaH)
#str(TablaH)
Tabla1 <- TablaH

summary(Tabla1)
## create the ggplot data
#Tabla2 <- Tabla1 %>%
#  filter(Categorie == "8000" | Categorie == "7000")
#filter(Categorie == "7000")
#Tabla2

#names(Tabla2)
#LL <- ggplot(Tabla2, aes(x = Metres, y = reorder(Mountain, Metres)), size = 0.2) +
#  # use a larger dot
#  geom_segment(aes(yend = Mountain), xend = 0, colour = "grey50") +
#  # plot the n points and color them
#  geom_point(size = 1) +
#  labs(title = "", x = "Meters", y = "Mountain") +
#  theme_bw() 
#LL <- LL + theme(axis.text = element_text(size = 8),
#                 axis.title = element_text(size = 14,face = "bold"))
#LL

#LL+geom_text(aes(label=Tabla2$Mountain), 
#                    color="gray20", size=1)

#gg <- ggplotly(LL)
#gg
## use the simple theme


## Make the graph
#plot_ly(Tabla2, x = Metres, y = Mountain, mode = "markers" , marker = list( color = ifelse(Metres > 8000,"red","blue") , opacity = 0.5 , size = 5) ) %>%
  
#  #Add the segment with add_trace
#  #add_trace(x = nrow(Tabla2), y = c(min(Metres), max(Metres)), mode = "lines") %>%
  
#  #Layout
#  layout(showlegend = T)


