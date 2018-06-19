# readfiletype("./specdata/1filetype")
## paste("0", filename, filetype, sep = "")

pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = "001") {
  
  files <- list.files(path = directory, id, pattern = paste(".csv$", sep=""), full.names = TRUE)
  
  # Since you build this up you first need a starting value
  pollutantsum <- 0
  pollutantcount <- 0
  # Use the files argument as the 'seq' argument
  for (file in files[id]) {
    new_data <- read.csv(paste0(file, sep = ""))
    pollutantsum <- pollutantsum + sum(new_data[,pollutant], na.rm=TRUE)
    pollutantcount <- pollutantcount + length(na.exclude(new_data[,pollutant])) }
    meanofpollutant <- (pollutantsum / pollutantcount)
    
    print(c("Count is ", pollutantcount))
    print(c("Mean is ", meanofpollutant))
  
}