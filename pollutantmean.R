pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
 
  files_list <- list.files(directory, full.names=TRUE)  #creates a list of files
  dat <- data.frame()  #creates an empty dataframe
  for (i in id) {      #loops trhough the files, rbinding them together
    dat <- rbind(dat, read.csv(files_list[i]))    
  }
  dat_subset <- dat[which(dat[,"ID"] %in% id),] #subsets the data contained in the 'id' input (%in% is a match function)
  round(mean(dat_subset[, pollutant], na.rm=TRUE),3)  #identifies the mean of pollutant with NA removed
}
