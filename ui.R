library(shiny)
#library(leaflet)
library(knitr)
library(plotly)
library(ggplot2)
library(ggplot2movies)


# Define UI for slider demo application
shinyUI(fluidPage(
  #Application title
  titlePanel("Precios máximos de la Gasolina y Diesel a partir de enero 2017"),
  bootstrapPage(
       h4("A partir de enero del 2017, el precio de la gasolina será liberado en México. 
        El aumento no será el mismo en cada estado, región y municipio."),
       h4("La Comisión Reguladora de Energía", tags$a(href = "http://www.gob.mx/cre", "CRE" ),
        "ha establecido precios máximos para cada zona y área. Ésta visualización se realizó con los",
        tags$a(href = "http://www.gob.mx/cre/articulos/precios-maximos-de-combustibles-enero?idiom=es", "datos"), "del mismo sitio")), 
       h4("Las líneas roja, verde y negra son el precio actual (Diciembre 2016), de la gasolina Premium, Magna y el Diésel respectivamente"),
       h4("Las líneas roja, verde y negra de trazo (en inglés: dashed) son el precio de enero del 2016, de la gasolina Premium, Magna y el Diésel respectivamente"),
       br(),
       h4("Los tipos de combustibles son Gasolina de menos de 92 octanos (Gas.menos.92), gasolina de más de 92 octanos (Gas.mas.92) y Diésel"),
       br(),
            
      #                                                   h4("Datos de las Regionales de ", tags$a(href = "http://www.conabio.gob.mx/", "Conabio"  ) ,"en Oaxaca, Chiapas
      #                      Tabasco, Campeche, Yucatán y Quintana Roo."),
      #          h4("Información adicional sobre el corredor biológico mesoamericano", tags$a(href="http://www.biodiversidad.gob.mx/corredor/corredor.html", "aqui" )),
      #          h5("A continuación se explican cada una de las pestañas del análisis de los datos:") ),
   
                 sidebarPanel(
      
      #meters
      #sliderInput(inputId = "Metres", label = "High of the Mountain:", min = 0, max = 8850, value = c(0,8850)),
      
      #Region
  #    selectInput(inputId = "Region",
  #                label = h6("Regiones:"),
  #                c("All", levels(Tabla1$Region))),
      
      #Por Estado
      selectInput(inputId = "Estado",
                  label = h3("Estado:"),
                  c("All", levels(Tabla1$Estado))),
                  #selected = c("Oaxaca"), choices = levels(Tabla1$Estado)),
      
      #Por Municipio/Zona
      selectInput(inputId = "Gazs",
                  label = h3("Tipo de Combustible:"),
                  selected = c("Diésel"), choice = names(Tabla1[,6:8])),
  #    
      
      #checkboxGroupInput("Categorie", label = h6("Categorie (m):"),
      #                   choice = levels(Tabla1$Categorie), selected = levels(Tabla1$Categorie)),
      
      
      h3("Data Used"),
      downloadButton('downloadData', 'Descargar (csv)'),
      #br(),
      br(),
      #br(),
      br(),
      h4("Source:"),
      tags$a(href = "http://www.gob.mx/cre", "CRE"),
      br(),
      h6("commentarios: aponce@conabio.gob.mx & aponce73pm@gmail.com"),
      #br(),
      h5("Github:"),
      tags$a(href = "https://github.com/APonce73/GasolinaPrice", "Gasolinas"),
      width = 2),
    # fluidRow(
    #  column(9,plotlyOutput("plot11"))
    #)
    mainPanel(
      plotlyOutput("plot11", width = 1500, height = 1200),
      br(),
      br(),
      tableOutput('points11')
      #tableOutput('TablaLL')
      
    )
))

