library(shiny)
shinyUI(pageWithSidebar(
headerPanel("Dictation Exercise Helper"),
sidebarPanel(width = 9,

  selectInput("select", label = h4("Word class to identify"), 
              choices = list("Coordinating conjunction (CC)" = "CC",
                             "Cardinal number (CD)" = "CD",
                             "Determiner (DT)" = "DT",
                             "Existential there (EX)" = "EX",
                             "Foreign word (FW)" = "FW",
                             "Preposition or subordinating conjunction (IN)" = "IN",
                             "Adjective (JJ)" = "JJ",
                             "Adjective, comparative (JJR)" = "JJR",
                             "Adjective, superlative (JJS)" = "JJS",
                             "List item marker (LS)" = "LS",
                             "Modal (MD)" = "MD",
                             "Noun, singular or mass (NN)" = "NN",
                             "Noun, plural (NNS)" = "NNS",
                             "Proper noun, singular (NNP)" = "NNP",
                             "Proper noun, plural (NNPS)" = "NNPS",
                             "Predeterminer (PDT)" = "PDT",
                             "Possessive ending (POS)" = "POS",
                             "Personal pronoun (PRP)" = "PRP",
                             "Possessive pronoun (PRP$)" = "PRP$",
                             "Adverb (RB)" = "RB",
                             "Adverb, comparative (RBR)" = "RBR",
                             "Adverb, superlative (RBS)" = "RBS",
                             "Particle (RP)" = "RP",
                             "Symbol (SYM)" = "SYM",
                             "to (TO)" = "TO",
                             "Interjection (UH)" = "UH",
                             "Verb, base form (VB)" = "VB",
                             "Verb, past tense (VBD)" = "VBD",
                             "Verb, gerund or present participle (VBG)" = "VBG",
                             "Verb, past participle (VBN)" = "VBN",
                             "Verb, non-3rd person singular present (VBP)" = "VBP",
                             "Verb, 3rd person singular present (VBZ)" = "VBZ",
                             "Wh-determiner (WDT)" = "WDT",
                             "Wh-pronoun (WP)" = "WP",
                             "Possessive wh-pronoun (WP$)" = "WP$",
                             "Wh-adverb (WRB)" = "WRB"
              ), 
              selected = 1),
  textInput("text", label = h4("Type text here"), value = "The quick brown fox jumps over the lazy dog")
  
  
),
mainPanel(width = 9,
h3('Output - word class and words identified'),
fluidRow(column(3, verbatimTextOutput("select"))),
fluidRow(column(3, verbatimTextOutput("text")))
)
))