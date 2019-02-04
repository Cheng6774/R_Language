library(shiny)
library(shinydashboard)
library(lattice)
library(ggplot2)
library(arules)
library(arulesViz)
library(rCharts)
library(DT)
library(networkD3)

data(MisLinks)
data(MisNodes)

function(input, output){
  output$splom <- renderPlot({
    splom(mtcars[c(1, 3:7)], groups = mtcars$cyl,
          pscales = 0, pch = 1:3, col = 1:3,
          varnames = c("Miles\nper\ngallon", "Displacement\n(cu. in.)",
                       "Gross\nhorsepower", "Rear\naxle\nratio",
                       "Weight", "1/4 mile\ntime"),
          key = list(columns = 3, title = "Number of Cylinders",
                     text = list(levels(factor(mtcars$cyl))),
                     points = list(pch = 1:3, col = 1:3)))
  })
  output$wireframe <- renderPlot({
    wireframe(volcano, shade = TRUE,
              aspect = c(61 / 87, 0.4),
              light.source = c(10, 0, 10))
    
  })
  
  
  output$myggplot1 <- renderPlot({
    qplot(Species, Sepal.Length, data = iris,
          geom = c("boxplot", "jitter"), fill = Species)
  })
  output$myggplot2 <- renderPlot(({
    data(singer, package = "lattice")
    ggplot(data = singer, aes(x = height, fill = voice.part)) +
      geom_density() +
      facet_grid(voice.part~.)
  }))
  
  
  output$groceryrules <- renderPlot({
    data(Groceries)
    groceryrules <- apriori(Groceries,parameter = 
                              list(support=0.006, confidence = 0.25, minlen = 2))
    plot(subset(groceryrules, lift > 3),method = input$method)
  })
  
  clusters <- reactive({
    kmeans(iris[, 1:4], input$clusters)
  })
  output$kmeans <- renderPlot({
    plot(iris[, c('Sepal.Length', 'Sepal.Width')],
         col = clusters()$cluster,
         pch = 20, cex = 2)
    points(clusters()$centers, pch = 4, cex = 2, lwd = 4)
  })
  
  output$lm.fit <- renderPlot({
    fit <- lm(Sepal.Length ~ Sepal.Width, data = iris[, 1:4])
    par(mfrow = c(2, 2), pch = "*", bg = "aliceblue")
    plot(fit)
  })
  
  
  output$mychart1 <- renderChart({
    hair_eye_male <- subset(as.data.frame(HairEyeColor), Sex == "Male")
    hair_eye_male[,1] <- paste0("Hair", hair_eye_male[,1])
    hair_eye_male[,2] <- paste0("Eye", hair_eye_male[,2])
    p1 <- nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = "multiBarChart")
    p1$chart(color = c('brown', 'blue', '#594c26', 'green'))
    p1$addParams(dom = "mychart1")
    return(p1)
  })
  
  output$mychart2 <- renderChart({
    a <- hPlot(Pulse ~ Height, data = MASS::survey, type = "bubble", 
               title = "Zoom demo", subtitle = "bubble chart", size = "Age", 
               group = "Exer")
    a$colors('rgba(223, 83, 83, .5)', 'rgba(119, 152, 191, .5)', 'rgba(60, 179, 113, .5)')
    a$chart(zoomType = "xy")
    a$exporting(enabled = T)
    a$addParams(dom = "mychart2")
    return(a)
  })
  
  
  output$MisLinks <- DT::renderDataTable({
    DT::datatable(MisLinks, rownames = F)
  })
  output$MisNodes <- DT::renderDataTable({
    DT::datatable(MisNodes, rownames = F)
  })
  
  
  output$networkD3 <- renderForceNetwork({
    forceNetwork(Links = MisLinks, Nodes = MisNodes,
                 Source = "source", Target = "target",
                 Value = "value", NodeID = "name",
                 Group = "group", opacity = 0.8, zoom = T)
  })
}