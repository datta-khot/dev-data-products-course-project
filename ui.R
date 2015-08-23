

shinyUI(pageWithSidebar(
  headerPanel("Chick weight prediction using linear regression algorithms"),
  sidebarPanel(
    #select the ression modelling algorithm
    radioButtons("algo", label = h3("Select Algorithm"),
                 choices = list("lm" = "1",
                                "glm" = "2"),
                 selected = 1
    ),
    #Show slider input to choose chick time/age
    sliderInput('time', 'Choose time to predict weight', value=10, min=0, max=21, step=1)
  ),
  
  mainPanel(
    h2('Overview:'),
    h3('Shiny application to show different model information using default ChickWeight dataset.'),
    h3('It builds the model using user selected regression algorithms - lm or glm.'),
    #h4('Head rows: ChickWeight dataset'),
    #tableOutput('chickHead'),
    #h4('Summary: ChickWeight dataset'),
    #tableOutput('chickSummary'),
    #h4('Plot: ChickWeight dataset'),
    #plotOutput('newPlot'),
    h2('Selected Algorithm:'),
    verbatimTextOutput("algorithm"),
    h2('Choosen Time:'),
    verbatimTextOutput("time"),
    h2('Model Information:'),
    verbatimTextOutput('newModel')
  )
))