example <- read.csv(path, stringsAsFactor = FALSE) //Reading data from original dataset
example[,2] <- NULL //Removal of redundant columns
example <- example[, -c(3:8)] 
yearfunct <- function(){
      total_sales <- c() //Initialising vectors
      game_of_the_year <- c()
      max_sales_of_the_year <- c()
      current_year <- c()
      for(year in 1980:2017){ //iterating through each year
         current_year <- c(current_year, year) 
                             
         year <- subset(example, Year == year) //creating a subset of the example data frame where the 'Year' is equal to 'year'
         total_sales <- c(total_sales, sum(year$Global_Sales)) //storing the total video games sales of the current year
                             
         maxsales <- max(year$Global_Sales) //Obtaining the value of for the maximum sale of a video game taken place in current year
         max_sales_of_the_year <- c(max_sales_of_the_year, maxsales)
                             
         index <- which(year$Global_Sales == maxsales) //Obtaining the index of maxsales in order to obtain the name of the video game that had maximum sales
         maxname <- year[index, "Name"]
         game_of_the_year <- c(game_of_the_year, maxname)
       }
      gametab <- cbind(current_year, game_of_the_year, max_sales_of_the_year, total_sales) //Combining the data to obtain resulting data frame
      gametab
}
