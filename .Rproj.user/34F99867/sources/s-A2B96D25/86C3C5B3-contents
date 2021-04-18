
library(shiny)
library(shinydashboard)
library(cluster) 
library(gridExtra)
library(NbClust)
library(factoextra)
server <- shinyServer(function(input,output){
 
  output$hplot <- renderPlot({
  	a=table(mf$Gender)
    barplot(a,main="Using BarPlot to display Gender Comparision",
       ylab="Count",
       xlab="Gender",
       col=rainbow(2),
       legend=rownames(a))
  })
  output$bplot <- renderPlot({
    a=table(mf$Gender)
    pct=round(a/sum(a)*100)
    lbs=paste(c("Female","Male")," ",pct,"%",sep=" ")
    pie3D(a,labels=lbs,
          main="Pie Chart Depicting Ratio of Female and Male")
  })

  output$hplot1 <- renderPlot({
  	hist(mf$Age,
    col="blue",
    main="Histogram to Show Count of Age Class",
    xlab="Age Class",
    ylab="Frequency",
    labels=TRUE)
  })
 
 output$bplot1 <- renderPlot({
    boxplot(mf$Age,
       col="purple",
       main="Boxplot for Descriptive Analysis of Age")
  })
 output$hplot2 <- renderPlot({
  	hist(mf$Annual.Income..k..,
  col="#660033",
  main="Histogram for Annual Income",
  xlab="Annual Income Class",
  ylab="Frequency",
  labels=TRUE)
  })
 
 output$bplot2 <- renderPlot({
    plot(density(mf$Annual.Income..k..),
    col="yellow",
    main="Density Plot for Annual Income",
    xlab="Annual Income Class",
    ylab="Density")
polygon(density(mf$Annual.Income..k..),
        col="#ccff66")
  })
 output$hplot3 <- renderPlot({
  hist(mf$Spending.Score..1.100.,
    main="HistoGram for Spending Score",
    xlab="Spending Score Class",
    ylab="Frequency",
    col="#6600cc",
    labels=TRUE)
  })
 
 output$bplot3 <- renderPlot({
    boxplot(mf$Spending.Score..1.100.,
   horizontal=TRUE,
   col="#990000",
   main="BoxPlot for Descriptive Analysis of Spending Score")
  })

 output$hplot4<- renderPlot({
  fviz_nbclust(mf[,3:5], kmeans, method = "silhouette")
  })

 output$hplot5<- renderPlot({
  k6<-kmeans(mf[,3:5],6,iter.max=100,nstart=50,algorithm="Lloyd")
		set.seed(1)
		ggplot(mf, aes(x =Annual.Income..k.., y = Spending.Score..1.100.)) + 
		  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
		  scale_color_discrete(name=" ",
		              breaks=c("1", "2", "3", "4", "5","6"),
		              labels=c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5","Cluster 6")) +
		  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")
		  })
 
  output$dataset <- renderDataTable(mf)
})