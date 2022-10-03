
#This code uploads the user input data into RStudio
file_name <- readline()
#This defines the data frame as the user input data that had been uploaded
MachineRead_output <- read.csv(file_name)

#Each of these 4 lines of code remove an unnecessary character from the names in the Paper.ID column
MachineRead_output$`Paper.ID` <- gsub("\\[", "", MachineRead_output$`Paper.ID`)
MachineRead_output$`Paper.ID` <- gsub("\\'", "", MachineRead_output$`Paper.ID`)
MachineRead_output$`Paper.ID` <- gsub("\\]", "", MachineRead_output$`Paper.ID`)
MachineRead_output$`Paper.ID` <- gsub(" ", "", MachineRead_output$`Paper.ID`)

#This creates a new empty vector to store the individual paper IDs in later
paperID <- c()

#This for loop repeates for each row in the 
for (each in MachineRead_output$Paper.ID) {
  #This puts each of the inidvidual paper IDs into the previously made vector
  paperID <- unlist(strsplit(each, ","))
  #this creates vector with the row numbers of each paper ID
  rowNumbers <- which(each == MachineRead_output$Paper.ID)
  #This creates a column saying how many papers that interaction has
  MachineRead_output$uniqueNumID[rowNumbers] <- length(unique(paperID))
  
}

#This creates a vector with the rows that only have 1 paper
rowsToRemove <- which(MachineRead_output$uniqueNumID == 1)
#This creates a new data frame that doesn't include the interactions with only 1 paper.
MachineRead_output2 <- MachineRead_output[-c(rowsToRemove),]

