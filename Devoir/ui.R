#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Chargement des données WorldPhones
data("WorldPhones")

# Define UI for application 
ui <- fluidPage(
  
  # Application title
  titlePanel("Telephones"),
  
  # Sidebar with a text input and slider inputs
  sidebarLayout(
    sidebarPanel(
      textInput("nom", "Quel est ton nom ?"),
      
      # Sélection du continent (choix basé sur les lignes de WorldPhones)
      selectInput("cont", "Continent", choices = colnames(WorldPhones)),
      
      # Sélection de l'année (choix basé sur les colonnes de WorldPhones)
      selectInput("dates", "Annee", choices = rownames(WorldPhones)),
      
      # Afficher la valeur sélectionnée
      verbatimTextOutput("valeur1"),
      verbatimTextOutput("valeur2")
    ),
    
    # Main panel with outputs
    mainPanel(
      h1(textOutput("salutation")), 
      dataTableOutput("head"),
      plotOutput("le_graphe")
    )
  )
)