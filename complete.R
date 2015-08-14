complete <- function(directory, id = 1:332) {
  #------------------------------------------------------------------------------
  # Programe Name: complete
  # Description  : 
  #     The function should return a data frame where the first column is the 
  #     name of the file and the second column is the number of complete cases
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

    fileList<-list.files(NewDirectory)
    
    output <- matrix(NA,0,2)
    for (i in id) {
      data <- read.csv(file=fileList[i])
      cData <- !is.na(data)
      ComData <- c(i, nrow(data[cData[,1]&cData[,2]&cData[,3]&cData[,4],]))
      output <- rbind(output, ComData)
    }
    colnames(output)=c("id", "nobs")
    rownames(output)<-NULL
    result <- as.data.frame(output)
    
    # Re-Set it to original working directory
    setwd(OriginalWD)
  
    # Return File name and complete row count  
    return(result)
}
