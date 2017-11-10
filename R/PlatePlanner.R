# 96-well Plate Planner Package
# Authors: Mathieu Lajoie- Mona Parizadeh
# Year: 2017

#### Install packages ####
#install.packages("devtools")
library(devtools)
#devtools::install_github("klutometis/roxygen") # Generates an Rd documentation
library(roxygen2)

#### Create package directory ####
setwd("/Users/memol/R_projects/")
#create("PlatePlanner")

#### Create function ####
# A plate_planner function
# This function allows to divide 94 samples into a 96-well PCR plate (it keeps 2 empty wells for the ctrl+ and ctrl-)
# In order to reduce the effects of technical errors, it will not to put the samples from the same habitat, month, site, or treatment (and replicate) next to each other.
# If there are more than 94 samples, it will continue the function till putting the last sample in the last plate.

#### Create plate table ####
# Variables
#' @param " " sample table
#'@keywords samp
#' @export
#' @examples
# create_sample_plate()
samp_by_plate = 94
nb_col = 8
nb_row = 12
nb_samp = nrow(" ")

create_sample_plate = function(nb_samp, nb_row, nb_col, nb_reserved = 0){

  samp_by_plate = nb_row*nb_col - nb_reserved
  P = data.frame(row.names = 1:nb_samp)

  P$plate_ID = (1:nb_samp - 1) %/% samp_by_plate + 1
  P$plate_index = (1:nb_samp - 1) %% samp_by_plate + 1

  P$row_ID = (P$plate_index - 1) %/% nb_col + 1
  P$col_ID = (P$plate_index - 1) %% nb_col + 1
  P
}

#P = create_sample_plate(nb_samp = nrow(" "),nb_row = 12,nb_col = 8,nb_reserved = 2)

#head(P, n = 20)

#### Process the documentation ####
setwd("./PlatePlanner")
document()

#### Install the package ####
setwd("..")
install("PlatePlanner")



# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#hello <- function() {
#  print("Hello, world!")
#}

