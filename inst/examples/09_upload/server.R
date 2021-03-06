library(shiny)

shinyServer(function(input, output) {
  output$contents <- reactiveTable(function() {
    
    # input$file1 will be NULL initially. After the user selects and uploads a 
    # file, it will be a data frame with 'name', 'size', 'type', and 'data' 
    # columns. The 'data' column will contain the local filenames where the data
    # can be found.

    inFile <- input$file1

    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$data, header=input$header, sep=input$sep, quote=input$quote)
  })
})
