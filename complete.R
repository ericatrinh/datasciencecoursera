complete <- function( directory, id = 1:332 ){
    dir <- paste( getwd(), directory, sep = "/" )
    monitors <- list.files( path = dir, full.name = TRUE )
    range <- length(id)
    ret <- data.frame( "id" = id, "nobs" = range )
    for(i in 1:range){
        name <- id[i]
        table <- read.csv(monitors[name], header = TRUE )
        pollution <- table[,2] + table[,3]
        comp <- pollution[!is.na(pollution)]
        ret[i,2] <- length( comp )
    }
    ret
}