homePage <- tabPanel( "Home"
                      
                      , fluidPage( # Sidebar with a dropdown for selecting Country
                      
                          # Show a plot of the endangered species by country
                           mainPanel( h1("Welcome to the Endangered Species Trends App!"),
                            
                            br(),
                                      
                            p("Because we know that species have been disappearing from this plannet at a devastating rate,"),
                            p("this WebApp was designed to help users see the trends of this disappearance."),
                            
                            br(),
                            
                            p("Designed so that users can investigate trends in the United States of America and in"),
                            p("the world per country, we hope that this app is useful to areas of conservation"),
                            p("by allowing users to become a bit more familiar with the world in which they live."),
                            
                            br(),
                            
                            p("Around the world, what are the trends to endangered species loss?"),
                            p("Are the species inhabiting some countries at more risk than others?"),
                            p("Or, are the species inhabiting some US States at more risk than others?"),
                            p("These are the questions that you'll be able to answer after investigating this app."),
                            
                            br(),
                            
                            p("Authors of this app are Olivia Kubli, Emily Limmer, Virginia McGhee, and Morgan Trimas"), 
                            p("We thank Dr. Whitworth for his help during this class."),
                            p("Without him, this app would not have been possible.")
                          )
                        )
                      )
