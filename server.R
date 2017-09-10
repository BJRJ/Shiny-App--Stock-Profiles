library(anytime)
library(plotly)
library(corrplot)

server <- function(input, output) {
  
  

 
  myfnc<-function(x){
    a<-as.character(x)
    b<-strsplit(a,",")
    c<-as.numeric(b[[1]][2])
    return(c)
  }
  myfnc2<-function(x){
    a<-as.character(x)
    b<-strsplit(a,",")
    c<-b[[1]][1]
    return(c)
  }
  datesfunc<-function(sdata){
    dates<-vector(length = length(sdata))
    for( i in 1:length(sdata)){
    if (!is.na(pmatch("a",sdata[i]))){
      date_1<-anydate(as.numeric(substr(sdata[i],2,11)))
      date<-date_1
      
    }
    else{
      date<-date_1+as.numeric(sdata[i])
      
    }
      dates[i]<-date
      
    }
    return((dates))
    
  }
  fullpath <- eventReactive(input$stocks, {
   
  })
  values <- reactiveValues()
  
  useVTH<-observe(
    {
      if(is.null(input$stocks))     return(NULL) 
      if(input$stocks=="")   {  return(NULL) }
      
 
      stock_names<-strsplit(input$stocks,',')
      days<-input$days
      temp1<-'https://www.google.com/finance/getprices?i=86400&p='
      temp2<-'d&f=d,o,h,l,c,v&df=cpct&q='
      
      for (i in 1:(length(stock_names[[1]])))
      {
        
        name<-(stock_names[[1]][i])
        link<-paste(temp1,days+1,temp2,toupper(stock_names[[1]][i]),sep="")
       
        x=read.table(link)
        y<-as.data.frame(x[(as.integer(rownames(x))>7),])
        colnames(y)<-'DATA'
        sdata<-apply(y,1,myfnc)
        sdata2<-apply(y,1,myfnc2)
   
        ts<-datesfunc(sdata2)
  
        df<-data.frame(Day=as.Date(ts,origin = "1970-01-01"),Value=sdata,Ticker=name)
        df2<-data.frame(sdata)
        colnames(df2)<-name

        if(i==1)
        {
          final_data<-df
          final_data2<-df2
        }
        else{
          final_data<-rbind(final_data,df)
          final_data2<-cbind(df2,final_data2)
        }
        
      }
      values$df<-final_data
      values$df2<-final_data2
 
      
      
    }
  )

    output$plot <- renderPlotly({
    
      if(is.null(values$df)){
        return(NULL)
      }
      else{
      p<-plot_ly(values$df,x=~Day,y=~Value,mode="markers",color = ~Ticker,type='scatter',mode='lines')
      p <- layout(p, 
                  yaxis = list(title="Stock Price (USD)")) 
       if(input$somevalue)
       {
         p <- layout(p, 
                    yaxis = list(type = "log",title="Stock Price (USD)"))      
      
      }
      p
      }
    }
      )
    
   

  
    output$plot2 <- renderPlot({
      if(input$featureplot)
      {
     
      if(is.null(values$df)){
        return(NULL)
      }
      else if (length(colnames(values$df2))==1){
        return(NULL)
      }
      else{
        pairs(values$df2)

        
      }
      }
    }
    )
    
    
    output$plot3 <- renderPlot({
     
      if(input$corrplot)
      {
      if(is.null(values$df2)){
       # print("null")
        return(NULL)
      }
      else if (length(colnames(values$df2))==1){
        return(NULL)
      }
      else{
        col4 <- colorRampPalette(c("#7F0000","red","#FF7F00","yellow","#7FFF7F", 
                                   "cyan", "#007FFF", "blue","#00007F"))
        corrplot(cor(values$df2),col=col4(10))        
        
      }
      }
    }
    )
    
  
  
}

