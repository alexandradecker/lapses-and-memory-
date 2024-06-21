#### Exclusions ####

outlier <- data.table(participant = c(163, 201, 20), exclusion= c("low task accuracy", "low task accuracy","large sustained attention score"))

info <- list()
info$memoryHitsDifferences<- list("memory_hits" = 'zero assigned to low confidnece in correct responses', 
                                  'memory_hits_dprime' = "NA assigned to all low confidnece hits regardless of accuracy")
