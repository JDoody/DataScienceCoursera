
# readfiletype("./specdata/1filetype")
## paste("0", filename, filetype, sep = "")

pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = "001") {
  pollutantcount <- 0
  pollutantsum <- 0
  
  filetype <- ".csv"
  pathswitch <- "."
  

  file_len <- nchar(id)
  if (file_len == 1) {
    new_id <- paste("00", id, filetype, sep = "")}
  else if (file_len == 2) {
    new_id <- paste("0", id, filetype, sep = "")}
  else
    new_id <- paste(id, filetype, sep = "")
    new_path <-  file.path(pathswitch,directory, new_id)
     new_data <- read.csv(new_path)
    pollutantsum <- pollutantsum + sum(new_data[,pollutant], na.rm=TRUE)
    pollutantcount <- pollutantcount + length(na.exclude(new_data[,pollutant])) 
    meanofpollutant <- (pollutantsum / pollutantcount) 
    print(meanofpollutant)
 }


