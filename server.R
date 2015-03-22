library(shiny)
library(ggplot2)

emberstats <- read.csv("data/emberstats.csv")
allFiles   <- emberstats

shinyServer(function(input, output) {

  p <- renderPlot(ggplot(
    allFiles, aes(x=lines_of_code, fill=filetype)) + 
      geom_density(alpha=.3) +
      scale_x_continuous(trans="log2") +
      facet_wrap( ~ filetype, ncol=1)
  )
  
  output$distPlot <- p
  
  p2 <- renderPlot({
    selectedFiles <- allFiles[allFiles$filetype == input$filetype,]
    ggplot(
      selectedFiles,
      aes(x=number_of_authors, y=lines_of_code, color=filetype)) +
      geom_point(shape=3) +
      geom_smooth(method=lm, se=TRUE, fullrange=T) +
      scale_colour_hue(l=50)    
  })
  
  output$authorsVsLoc <- p2
  
  p3 <- renderPlot({
    selectedFiles <- allFiles[allFiles$filetype == input$filetype,]
    ggplot(selectedFiles, aes(x=number_of_commits, y=lines_of_code, color=filetype)) +
      geom_point(shape=3) +
      scale_colour_hue(l=50) +
      scale_x_continuous(trans="log10") +
      scale_y_continuous(trans="log10") +
      geom_smooth(method=lm,
                  se=TRUE,
                  fullrange=T)
  })
  
  output$commitsVsLoc <- p3
  
  p4 <- renderPlot({
    selectedFiles <- allFiles[allFiles$filetype == input$filetype,]  
    ggplot(selectedFiles, aes(x=number_of_commits, y=number_of_authors, color=filetype)) +
      geom_point(shape=3) +
      scale_colour_hue(l=50) +
      scale_x_continuous(trans="log10") +
      scale_y_continuous(trans="log10") +
      geom_smooth(method=lm,
                  se=TRUE,
                  fullrange=T)
  })
  
  output$commitsVsAuthors <- p4
  
})
