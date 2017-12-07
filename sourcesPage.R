
sourcesPage <- tabPanel( "Sources"
                       , titlePanel( "Sources")
                        
                       , br()
                         
                       , h4( "United States Data:"
                           , helpText( a( "U.S. FWS Threatened & Endangered Species"
                                        , href = "https://ecos.fws.gov/ecp/report/table/critical-habitat.html"
                                        , target = "_blank"
                                        )
                                     )
                           )
                            
                       , br()
                        
                       , h4( "World Data:"
                           , helpText( a( "OECD Threatended Species by Country"
                                        , href = "https://ecos.fws.gov/ecp/report/table/critical-habitat.html"
                                        , target = "_blank"
                                        )
                                     )
                           )
                       , br()
                        
                       , h4( "GeoJSON Border Data:"
                           , helpText( a( "Johan Sundström GitHub"
                                        , href="https://github.com/johan/world.geo.json/blob/master/countries.geo.json"
                                        , target="_blank"
                                        )
                                     )
                           )
                        
                       , br()
                        
                       , h4( "Homepage Image Source:"
                           , helpText( a( "Image found using Creative Commons"
                                        , href= "http://www.planetpals.com/images/endangered_species_map.jpg"
                                        , target = "_blank"
                                        )
                                     )
                           )
                       )
