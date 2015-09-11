library(shiny)

shinyServer(
  function(input,output){
    Age <- reactive({
      input$Age
    })
    Gender <- reactive({
      input$Gender
    })
    Height <- reactive({
      input$Height
    })
    Weight <- reactive({
      input$Weight
    })
    Message <- reactive({
      if(Age()<=20)
      {
        if(Gender()=="Male")
        {
          "Hey Boy. Fitness conscious, I like it !"
        }
        else
        {
          "Hey Girl. Fitness conscious, I like it !"
        }
      }
      else if(Age() >20 & Age()<=60)
      {
        if(Gender()=="Male")
        {
          "Hello Sir. Consider this a guide to getting fit"
        }
        else
        {
          "Hello Maam. Consider this a guide to getting fit"
        }
      }
      else 
      {
        if(Gender()=="Male")
        {
          "Welcome Sir. It is a pleasure to have you"
        }
        else
        {
          "Welcome Maam. It is a pleasure to have you."
        }
      }
    })
    
    Conclusion <- reactive ({
      if(Result()<18.5)
      {
        "You are underweight. A balanced diet is what you need."
      }
      else if (Result() >=18.5 & Result() <25)
      {
        "Your weight is normal. Keep leading a healthy lifestyle."
      }
      else if (Result() >25 & Result()<30)
      {
        "You are overweight. Start eating healthy and exercise more often."
      }
      else
      {
        "You are obese. Consult a dietician or a physician because obesity is a cause of many diseases."
      }
    })
    
    Result <- reactive({Weight()/((Height()/100)^2)}) 
    output$BMIOutput <- renderText(Result())
    output$HelloMessage <- renderText(Message())
    output$Prediction <- renderText(Conclusion())
    
  }
)
