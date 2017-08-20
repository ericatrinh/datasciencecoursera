corr <- function(directory, threshold =0){
    dir <- paste( getwd(), directory, sep = "/" )
    monitors <- list.files( path = dir, full.name = TRUE )
    comp <- complete(directory)    
    correl <- vector('numeric')
    
    for( i in 1:length(monitors) ){
        if( comp[i,2] > threshold ){
            table <- read.csv(monitors[i], header = TRUE )
            num <-cor( table[,2], table[,3], use = "pairwise.complete.obs")
            correl <- c(correl,num)
        }
    }
    correl
}