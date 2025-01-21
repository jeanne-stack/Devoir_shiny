#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# Define server logic required to draw a plot
server <- function(input, output, session) {
  
  # Affichage de la salutation
  output$salutation <- renderText({
    paste0("Bienvenue ", input$nom)
  })
  
  # Affichage de la sélection du continent
  output$valeur1 <- renderText({
    paste("Continent sélectionné :", input$cont)
  })
  
  # Affichage de la sélection de l'année
  output$valeur2 <- renderText({
    paste("Année sélectionnée :", input$dates)
  })
  
  # Dataset réactif basé sur les choix de l'utilisateur
  dataset <- reactive({
    continent <- input$cont
    annee <- input$dates
    
    # Extraire la valeur du nombre de téléphones pour le continent et l'année sélectionnés
    value <- WorldPhones[annee, continent]
    return(value)
  })
  
  # Affichage du tableau des données sélectionnées
  output$head <- renderDataTable({
    data.frame(Continent = input$cont, Annee = input$dates, Telephones = dataset())
  })
  
  # Affichage du graphique
  output$le_graphe <- renderPlot({
    # Extraction des données pour l'année et le continent sélectionnés
    value <- dataset()
    
    # Créer un graphique (ici un barplot simple avec une seule valeur)
    barplot(value, main = paste("Nombre de téléphones fixes pour", input$cont, "en", input$dates),
            col = "lightblue", ylab = "Téléphones fixes", xlab = "Continent")
  })
}
