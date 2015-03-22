library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("EmberJS source code analysis"),
  helpText("This page contains the sourcestat application loaded with the EmberJS source metrics"),
  helpText("View the relations in the plots on the right and switch file types using the drop-down select on the left. This is primarily a js project so expect the most interesting data there."),
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
  helpText("The data used in this application was extracted from https://github.com/emberjs/ember.js at 73d49ffa092018557bb185d0aae41531e0a87e82")
  
  
))
