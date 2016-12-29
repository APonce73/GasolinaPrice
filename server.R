library(shiny)
#library(leaflet)
library(RColorBrewer)
library(dplyr)
library(knitr)
library(plotly)
library(ggplot2)
library(ggplot2movies)



# Define server logic for slider examples
shinyServer(function(input, output) {
  
  #### For the map in leaflet
  Katcha <- reactive({
    Gaz3 <- Tabla1 %>%
      select_( input$Gazs)
    TablaL <- Tabla1 %>% 
      select(Fecha, NoRedion, Region, Estado, Municipio.Zona)
    
      TablaL <- data.frame(TablaL, Gaz3)
      #rm(Gaz3)
      
      #rm(TablaL)
      
   
  })
  
  
  
  points <- reactive({
    
    TablaHH <- Katcha()
    names(TablaHH)[6] <- c("Gaz3")
    #TablaHH <- Tabla1
    #Altitud
    
    #Tabla1 <- Tabla1[c(Tabla1$Metres >= input$Metres[1] & Tabla1$Metres <= input$Metres[2]),]
    #if (input$Metres != "All") {
    #  Tabla1 <- Tabla1[Tabla1$Metres %in% input$Metres,]
    #}else Tabla1 <-  Tabla1
    
    #Categorias
    #if (input$Categorie != "All") {
    #  Tabla1 <- Tabla1[Tabla1$Categorie %in% input$Categorie,]
    #}else Tabla1 <- Tabla1
  #  
    #Por El Rango...
  #  if (input$Continent != "All") {
  #    Tabla1 <- Tabla1[Tabla1$Continent %in% input$Continent,]
  #  }else Tabla1 <- Tabla1
    
    #Por Region
#    if (input$Region != "All") {
#      TablaHH <- TablaHH[TablaHH$Region %in% input$Region,]
#    }else {TablaHH <- TablaHH
#    }
    
    #Por Estado
    if (input$Estado != "All") {
      TablaHH <- TablaHH[Tabla1$Estado %in% input$Estado, ]
    }else {TablaHH <- TablaHH
    }
    
    #Por Estado
  #  if (input$Municipio.Zona != "All") {
  #    Tabla1 <- Tabla1[Tabla1$Municipio.Zona %in% input$Municipio.Zona,]
  #  }else {Tabla1 <- Tabla1
  #  }
    
    
    
    #if(input$Periodo_Colecta != "All") {
    #  Tabla1 <- Tabla1[Tabla1$Periodo_Colecta %in% input$Periodo_Colecta,]
    #}else Tabla1 <- Tabla1
    
    #if ( is.null(hic.data[[z]]) ) { print("is null")}
    
  })
  
  
  #Para la tabla en csv 
  output$downloadData <- downloadHandler(
    filename = function() { paste("Tabla", '.csv', sep = '') },
    content = function(file) {
      write.csv(points(), file)
    }
  )

    #Es un comprobador de resultados
    output$TablaLL <- renderTable(
      print(Katcha()))
    
    #Es un comprobador de resultados
    #output$points11 <- renderTable(
    #  print(summary(points())))
    
    
  
  output$plot11 <- renderPlotly({
    #newData<-TablaVal
    newData <- points()
    #newData$Municipio.Zona <- factor(newData$Municipio.Zona, levels = newData[order(newData$Gaz3), "Municipio.Zona"])
    ### para la figura
    names(newData)
    #LL <- ggplot(newData, aes(x = Metres, y = reorder(Mount_Cont, Metres)), size = 0.2) +
    LL <- ggplot(newData, aes(x = reorder(Municipio.Zona, Gaz3), y = Gaz3), size = 1) +  
      # use a larger dot
      #geom_segment(aes(yend = Gaz3, colour = factor(Estado)), xend = 0) +
      geom_segment(aes(xend = Municipio.Zona, colour = factor(Estado)), yend = 0) +
      # plot the n points and color them
      geom_point(size = 1, color = "#298ae5") +
      labs(title = "", y = "Precio, pesos mexicanos", x = "Municipio/Zona") +
      theme_bw() + 
      geom_hline(yintercept = 13.98, color = "black") +
      geom_hline(yintercept = 14.81, color = "red") +
      geom_hline(yintercept = 14.63, color = "green") +
      geom_hline(yintercept = 13.77, color = "black", linetype = "dashed") +
      geom_hline(yintercept = 13.97, color = "red", linetype = "dashed") +
      geom_hline(yintercept = 13.16, color = "green", linetype = "dashed")
      #coord_flip()
    
    
    LL <- LL + theme(axis.text.x = element_text(size = 8,face = "bold", angle = 90),
                     axis.text.y = element_text(size = 6,face = "bold"),
                     #axis.ticks = element_blank(),
                     #panel.grid.minor. = element_blank(),
                     #panel.grid.major = element_line(colour = "black", linetype = "dotted"),
                    panel.grid.minor.x = element_blank(),
                     panel.grid.major.x = element_blank(),
                     axis.title = element_text(size = 14,face = "bold")) +
                     theme(legend.title = element_blank())

      
    #LL
    #LL+geom_text(aes(label=newData$Mountain), 
    #                    color="gray20", size=1)
    gg <- ggplotly(LL)
    gg
    
  })
})
