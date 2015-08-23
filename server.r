library(shiny)
library(datasets)
data("ChickWeight") #use existing ChickWeight dataset
library(caret) #use caret library for ML model building

shinyServer(
  function(input, output) {
    
    #Show first few records of ChickWeight dataset
    output$chickHead <- renderTable({
      head(ChickWeight)
    })
    
    #Show summary of ChickWeight dataset
    output$chickSummary <- renderTable({
      summary(ChickWeight)
    })
    
    #Plot a graph showing chick time/age against weight
    output$newPlot <- renderPlot({
      plot(ChickWeight$Time, ChickWeight$weight)
    })
    
    #Select algorithm (lm or glm) and chick time/age
    output$algorithm <- renderPrint({input$algo})     
    output$time <- renderPrint({input$time})     

    # Partition the ChickWeight dataset into training and test data
    set.seed(1234)    
    inTrain <- createDataPartition(y=ChickWeight$weight, p=0.7, list=FALSE)
    training <- ChickWeight[inTrain,]
    testing <- ChickWeight[-inTrain,]

    #Create a model based on the algorithm selected and training data
    output$newModel <- renderPrint({
      algo <- numeric(input$algo)
      if (algo == "1"){
        alg <- "lm"
      } else {
        alg <- "glm"
      }
      modelFit <- train(weight ~ ., data=training, method=alg)
      modelFit
    })      
  }
)