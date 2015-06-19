#' dimple - shiny demo
#'
#' @import shiny
#' @export
dimple_shiny<-function(){
  server <- function(input, output) {
    output$dimple <- renderdimple({
      dimple(sales,
             xCategory="Month",
             xOrderRule="Date",
             yMeasure=input$yvar)
    })


  }

  ui <- fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectInput("yvar", "measurement variable", choices = c("Cost.of.Sales",
                                                                "Cost.of.Sales.Monthly.Change",
                                                                "Operating.Profit.Monthly.Change",
                                                                "Price.Monthly.Change"))
      ),
      mainPanel(dimpleOutput("dimple"))
    )
  )

  shinyApp(ui = ui, server = server)
}
