library(shiny)
library(shinydashboard)
library(lattice)
library(ggplot2)
library(arules)
library(arulesViz)
library(rCharts)
library(DT)
library(networkD3)

dashboardPage(
  dashboardHeader(title = "数据可视化平台demo"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("lattice绘图展示", tabName = "latticedemo"),
      menuItem("ggplot2绘图展示", tabName = "ggplot2demo"),
      menuItem("模型结果可视化展示", tabName = "viz"),
      menuItem("rCharts绘图展示", tabName = "rChartsdemo"),
      menuItem("DT & networkD3 demo展示", tabName = "DNdemo")
    )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "latticedemo",
              box(title = "lattice包绘制散点图矩阵",
                  width = 6, solidHeader = TRUE,
                  background = "light-blue", plotOutput("splom")),
              box(title = "lattice包绘制三维图",
                  width = 6, solidHeader = TRUE,
                  background = "light-blue", plotOutput("wireframe"))),
      tabItem(tabName = "ggplot2demo",
              box(title = "ggplot2包绘制的箱线图",
                  width = 6, solidHeader = TRUE,
                  background = "aqua", plotOutput("myggplot1")),
              box(title = "ggplot2包绘制的核密度图",
                  width = 6, solidHeader = TRUE,
                  background = "aqua", plotOutput("myggplot2"))),
      tabItem(tabName = "viz",
              box(title = "关联规则可视化",
                  width = 6, solidHeader = TRUE, collapsible = T,
                  background = "red", plotOutput("groceryrules")),
              box(title = "kmeans结果可视化",
                  width = 6, solidHeader = TRUE, collapsible = T,
                  background = "red", plotOutput("kmeans")),
              column(6, selectInput(inputId="method", label="请选择关联规则可视化的method",
                                   choices=c("graph", "scatterplot","two-key plot", "matrix",  
                                             "matrix3D", "paracoord"))),
              column(6, numericInput('clusters', '请选择k值', 3,
                                    min = 1, max = 9)),
              column(12, box(title = "评价线性模型拟合情况可视化",
                            solidHeader = TRUE,collapsible = T, width = "100%",
                            background = "lime", plotOutput("lm.fit")))),
      tabItem(tabName = "rChartsdemo",
              box(title = "nPlot函数demo演示",
                  bsolidHeader = TRUE, collapsible = TRUE, width="100%",
                  showOutput("mychart1", "nvd3")),
              box(title = "hPlot函数demo演示",
                  bsolidHeader = TRUE, collapsible = TRUE, width = "100%",
                  showOutput("mychart2", "highcharts"))),
      tabItem(tabName = "DNdemo",
              box(title = "MisLinks",
                  bsolidHeader = TRUE, collapsible = TRUE, width = 6,
                  DT::dataTableOutput("MisLinks")),
              box(title = "MisNodes",
                  bsolidHeader = TRUE, collapsible = TRUE, width = 6,
                  DT::dataTableOutput("MisNodes")),
              box(title = "networkD3",
                  bsolidHeader = TRUE, collapsible = TRUE, width=12,
                  forceNetworkOutput("networkD3"))
      )
    )))
