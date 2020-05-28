
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


# ADDD SOME TEXT



