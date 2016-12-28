library(shiny)
#library(leaflet)
library(knitr)
library(plotly)
library(ggplot2)
library(ggplot2movies)


# Define UI for slider demo application
shinyUI(fluidPage(
  #Application title
  titlePanel("Precio de la Gasolina y Diesel a partir de enero 2017"),
  bootstrapPage(
    h4("A partir de 2017, el precio de la gasolina será liberado en México. 
        El aumento no será el mismo en cada estado, región y municipio. 
        La Comisión Reguladora de Energía", tags$a(href = "http://www.gob.mx/cre", "CRE" ),
        "ha establecido precios máximos para cada zona y área. Ésta visualización se realizó con los",
        tags$a(href = "http://www.gob.mx/cre/articulos/precios-maximos-de-combustibles-enero?idiom=es", "datos"), "del mismo sitio")), 
            
      #                                                   h4("Datos de las Regionales de ", tags$a(href = "http://www.conabio.gob.mx/", "Conabio"  ) ,"en Oaxaca, Chiapas
      #                      Tabasco, Campeche, Yucatán y Quintana Roo."),
      #          h4("Información adicional sobre el corredor biológico mesoamericano", tags$a(href="http://www.biodiversidad.gob.mx/corredor/corredor.html", "aqui" )),
      #          h5("A continuación se explican cada una de las pestañas del análisis de los datos:") ),
   
                 sidebarPanel(
      
      #meters
      #sliderInput(inputId = "Metres", label = "High of the Mountain:", min = 0, max = 8850, value = c(0,8850)),
      
      #Region
      selectInput(inputId = "Region",
                  label = h6("Regiones:"),
                  c("All", levels(Tabla1$Region))),
      
      #Por Estado
      selectInput(inputId = "Estado",
                  label = h6("Estado:"),
                  c("All", levels(Tabla1$Estado))),
      
      #Por Municipio/Zona
  #    selectInput(inputId = "Municipio.Zona",
  #                label = h6("Municipio/Zona:"),
  #                c("All", levels(Tabla1$Municipio.Zona))),
  #    
      
      #checkboxGroupInput("Categorie", label = h6("Categorie (m):"),
      #                   choice = levels(Tabla1$Categorie), selected = levels(Tabla1$Categorie)),
      
      
      h6("Data Used"),
      downloadButton('downloadData', 'Descargar (csv)'),
      #br(),
      br(),
      #br(),
      br(),
      h6("Source:"),
      tags$a(href = "http://www.gob.mx/cre", "CRE"),
      br(),
      h6("comments: aponce@conabio.gob.mx or aponce73pm@gmail.com"),
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
      tableOutput('TablaLL')
      
    )
))

