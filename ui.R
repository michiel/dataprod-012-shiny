library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("EmberJS source code analysis"),
  sidebarLayout(
    sidebarPanel(
      selectInput("filetype",
                  label   = "Choose a filetype to display",
                  choices = c("js",
                              "hbs",
                              "html",
                              "json",
                              "rb"
                  ),
                  selected = "js"
      ),
      plotOutput("distPlot")
    ),
    mainPanel(
      plotOutput("authorsVsLoc"),
      plotOutput("commitsVsLoc"),
      plotOutput("commitsVsAuthors")
      
    )  
  ),
  mainPanel("The data used in this application was extracted from https://github.com/emberjs/ember.js at 73d49ffa092018557bb185d0aae41531e0a87e82")
  
  
))
