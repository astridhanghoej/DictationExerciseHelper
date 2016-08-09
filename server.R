library(shiny)
shinyServer(
function(input, output) {
    output$select <- renderPrint({paste("Showing you words of type:",input$select)})
  output$text <- renderPrint({
    ## Get input
    text<-input$text
    select<-input$select
    
    ## Load libraries
    library("openNLP")
    library("NLP")
    library("reshape")
    library("dplyr")
    
    ## Convert input to string
    text <- as.String(text)
    
    ## Identify start and end of sentences and words
    anno2 <- annotate(text, list(Maxent_Sent_Token_Annotator(), Maxent_Word_Token_Annotator()))
    
    ## Classify words using positions identified above
    anno3 <- annotate(text, Maxent_POS_Tag_Annotator(), anno2)
    
    ## Determine the distribution of POS tags for word tokens.
    anno3word <- subset(anno3, type == "word")
    tags <- sapply(anno3word$features, `[[`, "POS")

    ## Extract token/POS pairs
    WordsClassified<-as.data.frame(1:length(sprintf("%s", tags)),)
    WordsClassified[,1]<-sprintf("%s", tags)
    WordsClassified[,2]<-sprintf("%s", text[anno3word])
    names(WordsClassified)<-c("class","word")
    
    ## Select the words to be printed
    PrintOutput<-WordsClassified%>%filter(class==select)%>%select(word)
  
    ## Making sure there are words to be printed and if not, prints an error message to the user.
    if(nrow(PrintOutput)==0){c("No such words in string")} else {PrintOutput}
  })
})