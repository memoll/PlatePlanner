## PPP (PCR Plate Planner)
R tool for plan the 96-well PCR plate in order to minimize the technical errors

### About
This package allows to divide 94 samples into a 96-well PCR plate (it keeps 2 empty wells for the ctrl(+) and ctrl(-)

In order to reduce the effects of technical errors, it will not to put the samples from the same habitat, month, site, or treatment (and replicate) next to each other.

If there are more than 94 samples, it will continue the function till putting the last sample in the last plate.

### Data Preparation
#### Read data 
D = read.csv("/path/file.txt", stringsAsFactors = FALSE)
head(D)


#### Create sample table ####
library(reshape2)
S = as.data.frame(matrix(unlist(strsplit(D$Sample.ID, "\\.")), ncol = 7, byrow = TRUE))
head(S)

colnames(S) = c("Crop",
                "Habitat",
                "Type",
                "Site",
                "Month",
                "Year",
                "Treatment")

S = cbind(Sample.ID = D$Sample.ID, S)
head(S)
