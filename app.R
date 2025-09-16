library(shiny)
library(bslib)

generate_story <- function(noun, verb, adjective, adverb) {
  glue::glue(
    "
    Once upon a time, there was a {adjective} {noun} who loved to
    {verb} {adverb}. It was the funniest thing ever!
  "
  )
}

ui <- page_sidebar(
  title = "Mad Libs Game",
  theme = bs_theme(preset = "lux"),
  sidebar = bslib::sidebar(
    textInput("noun1", "Enter a noun:", ""),
    textInput("verb", "Enter a verb:", ""),
    textInput("adjective", "Enter an adjective:", ""),
    textInput("adverb", "Enter an adverb:", "")
  ),
  h3("Your Mad Libs Story:"),
  textOutput("story")
)
# ui <- fluidPage(
#   titlePanel("Mad Libs Game"),
#   sidebarLayout(
#     sidebarPanel(
      
#     ),
#     mainPanel(
      
#     )
#   )
# )

server <- function(input, output) {

  output$story <- renderText({
    req(input$noun1, input$verb, input$adjective, input$adverb)
    generate_story(input$noun1, input$verb, input$adjective, input$adverb)
  })
}

shinyApp(ui = ui, server = server)
