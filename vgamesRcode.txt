>example <- read.csv(path, stringsAsFactor = FALSE)
>example[,2] <- NULL
>example <- example[, -c(3:8)]
> yearfunct <- function(){
+ total_sales <- c()
+ game_of_the_year <- c()
+ max_sales_of_the_year <- c()
+ current_year <- c()
+ for(year in 1980:2017){
+ current_year <- c(current_year, year)
+ year <- subset(example, Year == year)
+ total_sales <- c(total_sales, sum(year$Global_Sales))
+ maxsales <- max(year$Global_Sales)
+ max_sales_of_the_year <- c(max_sales_of_the_year, maxsales)
+ index <- which(year$Global_Sales == maxsales)
+ maxname <- year[index, "Name"]
+ game_of_the_year <- c(game_of_the_year, maxname)
+ }
+ gametab <- cbind(current_year, game_of_the_year, max_sales_of_the_year, total_sales)
+ gametab
+ }
