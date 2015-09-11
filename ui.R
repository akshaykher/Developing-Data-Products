library(shiny)

shinyUI(
  pageWithSidebar(
  headerPanel("Body Mass Index Calculator"),
  
  sidebarPanel(
    p('Hi !!! '),
    p('This is a body mass index calculator app'),
    p('Enter your Age, Gender, Height and Weight'),
    p('Click the Submit button to know the result and my advice'),
    numericInput('Age','Age',value=30,min=0,max=100,step=1),
    
    radioButtons("Gender","Gender",
                 c("Male","Female"
                   )),
    
    sliderInput('Height','Height(cm)',value=150,min=80,max=220,step=1),
    
    sliderInput('Weight','Weight(Kg)',value=100,min=10,max=200,step=1),
    
    submitButton("Submit")
    
  ),
  
  mainPanel(
    textOutput('HelloMessage'),
    h4("Your BMI is: "),
    textOutput('BMIOutput'),
    h4("What does it mean?"),
    textOutput('Prediction')
  )
  
  )
  
)
