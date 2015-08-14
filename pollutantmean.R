pollutantmean <- function(directory, pollutant, id = 1:332) {
  #------------------------------------------------------------------------------
  # Programe Name: pollutantmean
  # Description  : 
  #     This function 'pollutantmean' takes three arguments: 
  #     'directory', 'pollutant', and 'id' and returns the mean of the pollutant 
  #     across all of the monitors,ignoring any missing values coded as NA
  #
  # Created By  : Subrat Kumar Sahu
  #------------------------------------------------------------------------------
      # Set the environment
      library("plyr")
    
    # Get the working directory and store the path
      OriginalWD <- getwd()
    
    # Set the working directory to the desination, specified to the function
      NewDirectory <- paste(OriginalWD, directory, sep="/")
      setwd(NewDirectory)
      
    
    # Get the list of files available
      fileList <- sprintf("%03d.csv", id)
      fileListFull <- paste(NewDirectory, fileList, sep="/")
      
      ldataFrame <- lapply(fileListFull, read.csv)
      dataframe=ldply(ldataFrame)
    
    # Re-Set it to original working directory
      setwd(OriginalWD)
      
    # Compute the mean and retrun the value  
      mean(dataframe[, pollutant], na.rm = TRUE)
}

