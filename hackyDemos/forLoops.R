
# demonstrating for loops

# maks some data
a <- 1:20
b <- 2:21

# demonstrate R's ability to do
# vectorised computations
d <- a + b


# same thing using a for loop
# for loop that loops over all items in a
# and adds them to the i'th item in b
names <- 1:20

for(i in 1:length(names))  {
  thing <- a + b
  d <- c * b

}


# demonstrating how the apply function works
df <- data.frame(a, b)
df$e <- apply(df, 2, FUN = "sum")


# ADD SOME TEXT



# REAL LIFE EXAMPLE
library(here)
library(GeoLight)
library(FLightR)
library(dplyr)


# read txt files with names of the form '.lux'
trj_files = list.files(here("data/rawData/"), pattern = '.lux')

# folder namefor outputs
outfolder <- here("data/derivedData/")


# code for preparing the data for FlightR function
for (i in 1:length(trj_files)) {
  
  fn <- trj_files[[i]]
  bird <- substr(fn, 1,5)
  
  # load raw Lux files
  f <- GeoLight::luxTrans(here("data/rawData/", fn))
  
  # use GEOlight package function twilightCalc to find the times for twilight
  # use light threshold 10
  twi <- twilightCalc(f$datetime, f$light,
                      LightThreshold = 10,
                      ask = FALSE,
                      allTwilights = FALSE)
  
  #create a tag file for use in FlightR package
  tagfile <- GeoLight2TAGS(f, twi, threshold = 10)
  
  # create a tag file
  fname <- paste0(bird, "_tagfile.csv") 
  write.csv(tagfile, file = paste(outfolder, fname, sep= '/'), row.names = FALSE)
  
}


