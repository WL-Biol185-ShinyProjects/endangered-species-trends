homePage <- tabPanel( "Home"
                      
                      , fluidPage( # Sidebar with a dropdown for selecting Country
                      
                          # Show a plot of the endangered species by country
                           mainPanel( h1("Welcome to the Endangered Species Trends App!"),
                            
                            br(),
                            
                            img(src = "endangered_species_map.png", height = 400, width = 650),
                            
                            br(),
                            br(),
                            br(),
                            
                            h4("Because we know that species have been disappearing from this planet at a devastating rate
                              this WebApp was designed to help users see the trends of this disappearance."),
                            
                            br(),
                            
                            h4("Designed so that users can investigate trends in the United States of America and in the world per country, we hope that this app is useful to areas of conservation by allowing users to become a bit more familiar with the world in which they live."),
                            
                            br(),
                            
                            h4("Around the world, what are the trends to endangered species loss? Are the species inhabiting some countries at more risk than others? Or, are the species inhabiting some US States at more risk than others?
                            These are the questions that you'll be able to answer after investigating this app."),
                            
                            br(),
                            br(),
                            br(),
                            br(),
                            br(),
                           h6("Authors of this app are Olivia Kubli, Emily Limmer, Virginia McGhee, and Morgan Trimas. We thank Dr. Whitworth for his help during this class.
                         Without him, this app would not have been possible.")
                          )
                        )
                      )
