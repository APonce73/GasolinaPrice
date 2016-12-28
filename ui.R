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
      tags$a(href = "https://github.com/APonce73/GasolinePrice", "Gasolinas"),
      width = 2),
    # fluidRow(
    #  column(9,plotlyOutput("plot11"))
    #)
    mainPanel(
      plotlyOutput("plot11", width = 1500, height = 900),
      tableOutput('TablaLL')
      
    )
))

