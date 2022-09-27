

MachineRead_output <- read.csv("MachineRead_output.csv")

MachineRead_output$`Paper.ID` <- gsub("\\[", "", MachineRead_output$`Paper.ID`)
MachineRead_output$`Paper.ID` <- gsub("\\'", "", MachineRead_output$`Paper.ID`)
MachineRead_output$`Paper.ID` <- gsub("\\]", "", MachineRead_output$`Paper.ID`)
MachineRead_output$`Paper.ID` <- gsub(" ", "", MachineRead_output$`Paper.ID`)


paperID <- c()


for (each in MachineRead_output$Paper.ID) {
  
  paperID <- unlist(strsplit(each, ","))
  
  rowNumbers <- which(each == MachineRead_output$Paper.ID)
  
  MachineRead_output$uniqueNumID[rowNumbers] <- length(unique(paperID))
  
}


rowsToRemove <- which(MachineRead_output$uniqueNumID == 1)

MachineRead_output2 <- MachineRead_output[-c(rowsToRemove),]


