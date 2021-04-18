library(shiny)
library(shinydashboard)
library(plotrix)
library(cluster) 
library(gridExtra)
library(NbClust)
library(factoextra)
ui <- dashboardPage(skin = "purple",
  dashboardHeader(title = "Customer Segment"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Mall Dataset", icon = icon("th"), tabName = "widgets",
               badgeLabel = "csv", badgeColor = "green"),
       menuItem("Analysis By K-mean Cluster", icon = icon("th"), tabName = "cluster",
               badgeLabel = "Algo", badgeColor = "purple")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                # A static infoBox
                infoBox("Avg Age Group", mean(mf$Age), fill = TRUE,color = "blue",width=3),
                infoBox("Avg Annual Salary Group", mean(mf$Annual.Income..k..),  fill = TRUE,color = "red",width=3),
                infoBox("Avg Salary Spend Group", mean(mf$Spending.Score..1.100.), fill = TRUE,color = "yellow",width=3),
                infoBox("Dataset Entries", count(mf),  fill = TRUE,color = "green",width=3),
              
              ),
            
              fluidRow(
                tabBox(
                  title = "Visualization of Gender Distribution",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "400px",
                  tabPanel("Barplot", 
                                 box(
                                   title = "Barplot", status = "primary", solidHeader = TRUE,
                                   width=350,
                                   plotOutput("hplot", height = 250, )
                                 ),
                  ),
                  tabPanel("Pie 3D",  box(
                    title = "pie3d", status = "warning", solidHeader = TRUE,
                    width=350,
                    plotOutput("bplot", height = 250)
                  )
                  )
                ),
                tabBox(
                  title = "Visualization of Age Distribution",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "400px",
                  tabPanel("Histogram", 
                                 box(
                                   title = "Histogram", status = "success", solidHeader = TRUE,
                                   width=350,
                                   plotOutput("hplot1", height = 250, )
                                 ),
                  ),
                  tabPanel("Box Plot",  box(
                    title = "boxplot", status = "warning", solidHeader = TRUE,
                    width=350,
                    plotOutput("bplot1", height = 250)
                  )
                  )
                ),
                 tabBox(
                  title = "Analysis of the Annual Income of the Customers",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "400px",
                  tabPanel("Histogram", 
                                 box(
                                   title = "Histogram", status = "warning", solidHeader = TRUE,
                                   width=350,
                                   plotOutput("hplot2", height = 250, )
                                 ),
                  ),
                  tabPanel("Density Plot",  box(
                    title = "density plot", status = "success", solidHeader = TRUE,
                    width=350,
                    plotOutput("bplot2", height = 250)
                  )
                  )
                ),
                 tabBox(
                  title = "Analyzing Spending Score of the Customers",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "400px",
                  tabPanel("Histogram", 
                                 box(
                                   title = "Histogram", status = "danger", solidHeader = TRUE,
                                   width=350,
                                   plotOutput("hplot3", height = 250, )
                                 ),
                  ),
                  tabPanel("Box Plot",  box(
                    title = "box plot", status = "warning", solidHeader = TRUE,
                    width=350,
                    plotOutput("bplot3", height = 250)
                  )
                  )
                ),
               
            ),
            
             
      ),
      
      tabItem(tabName = "widgets",
              fluidPage(
                dataTableOutput("dataset")
              )
      ),
      tabItem(tabName = "cluster",
                fluidPage(
                
                                 box(
                                   title = "Determining Optimal Clusters - Average Silhouette Method", status = "danger", solidHeader = TRUE,
                                   width=350,
                                   plotOutput("hplot4", height = 300,  )
                                 ),
              
               
              
                                 box(
                                   title = "Visualization of Cluster ", status = "success", solidHeader = TRUE,
                                   width=350,
                                   plotOutput("hplot5", height = 400, )
                                 ),
                                
                
                )
      )
    ),
   
  )
)