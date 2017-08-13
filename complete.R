complete <- function(directory, id = 1:332) {
  # List of files to read monitor data
  files <- list.files(directory, full.names = TRUE)
  
  # Create an empty vector
  nobs_num <- numeric(0)
  
  for (i in id) {
    # Read in the file
    monitor <- read.csv(files[i], header = TRUE)
    
    # Count the number of complete cases and append to numeric vector
    nobs_num <- c(nobs_num, nrow(na.omit(monitor)))
  }
  # Return value is a data frame with TWO (2) columns
  data.frame(id = id, nobs = nobs_num)
}
