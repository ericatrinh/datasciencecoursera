pollutantmean <- function(directory, pollutant, id = 1:332){
    dir <- paste( getwd(), directory, sep = "/" )
    monitors <- list.files( path = dir, full.name = TRUE )
    num <- 0
    total <- 0
    for(i in id){
        table <- read.csv(monitors[i], header = TRUE )
        if( pollutant == "sulfate"){
            data <- table[,2]
        }
        if( pollutant == "nitrate" ){
            data <- table[,3]
        }
        total <- sum(data, na.rm = TRUE) + total
        num = length( data[!is.na(data)] ) + num
    }
    total/num
}