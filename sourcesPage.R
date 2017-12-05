sourcesPage <- tabPanel( "Sources",
          
          titlePanel("Data Sources"),
          
          br(),
          
          
          helpText( a("U.S. FWS Threatened & Endangered Species", href = "https://ecos.fws.gov/ecp/report/table/critical-habitat.html", target = "_blank")),
          helpText( a("OECD Threatended Species by Country", href = "https://ecos.fws.gov/ecp/report/table/critical-habitat.html", target = "_blank")),
          
          br(),
        
          h5("GeoJSON border data:",
             helpText( a("Johan Sundström GitHub", href="https://github.com/johan/world.geo.json/blob/master/countries.geo.json", target="_blank"))
                )
            )