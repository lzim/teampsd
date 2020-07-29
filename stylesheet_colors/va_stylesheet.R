#RMarkdown Facilitation Guide
#Code of interacting with Style

#LZ update 4.18.2017
#Possible code for checking for VA Style Colors
#Need to add: 1) font, 2) heading levels, and 3) margins

## Generate style sheet from R
sink(file = stylesheet_VA, type='output') 

#VA Primary Brand Colors
#VA Navy Blue - Primary
#Possible call function for color name; name color object "va_navy"
#Need to determine the function for this, possible lead: http://astrostatistics.psu.edu/su07/R/html/base/html/names.html
va_navy <- (cat("textarea {color: #003F72; }\n"))

#VA Light Blue Primary
cat("textarea {color: #0083BE; }\n")

#VA Red Primary
cat("textarea {color: #C4262E; }\n")

#VA Dark Red Primary
cat("textarea {color: #772432; }\n")

#VA Secondary Brand Colors

#VA Green Secondary
cat("textarea {color: #598527; }\n")

#VA Gold Secondary
cat("textarea {color: #f3cf45; }\n")

#VA Orange Secondary
cat("textarea {color: #f7955b; }\n")

#VA Blue Gray Secondary
cat("textarea {color: #839097; }\n")

#VA Light Gray Secondary
cat("textarea {color: #dcddde; }\n")

#VA Sand Secondary
cat("textarea {color: #cccc99; }\n")

#VA Olive Secondary
cat("textarea {color: #bec292; }\n")
