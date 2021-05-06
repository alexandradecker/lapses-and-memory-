
#load pacakages
library(roll); library(broom); library(lme4); library(lmerTest); library(dplyr); 
library(data.table); library(ggplot2); library(dtplyr); library(tidyr);library(reshape2); 
library(ggbeeswarm); library(tidyverse); library(tibble); library(optimx); library(Hmisc); 
library(DescTools);library(lm.beta); library(zoo); library(Hmisc); library(Smisc); library(imputeTS);
library(mediation); library(hausekeep)


#### GGPLOT THEMES ####

ggtheme = theme(plot.caption = element_text(hjust = -.2), 
                panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                panel.background = element_rect(fill = "white", colour = NA),
                axis.line.x = element_line(size = 1, linetype = "solid", colour = "black"), 
                axis.line.y = element_line(size = 1, linetype = "solid", colour = "black"),
                axis.text.x = element_text(size = 16, colour = 'black'), 
                axis.text.y = element_text(size = 16, colour = 'black'), 
                plot.title = element_text(size = 16, hjust = 0.5),
                text = element_text(size = 16), panel.spacing.x = unit(1, "lines"),
                legend.key = element_blank(), legend.key.height = unit(2, 'line')) 

ggtheme = theme(plot.caption = element_text(hjust = -.2), 
                panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                panel.background = element_rect(fill = "white", colour = NA),
                axis.line.x = element_line(size = 1, linetype = "solid", colour = "black"), 
                axis.line.y = element_line(size = 1, linetype = "solid", colour = "black"),
                axis.text.x = element_text(size = 16, colour = 'black'), 
                axis.text.y = element_text(size = 16, colour = 'black'), 
                plot.title = element_text(size = 16, hjust = 0.5),
                text = element_text(size = 16), panel.spacing.x = unit(1, "lines"),
                legend.key = element_blank(), legend.key.height = unit(2, 'line')) 

#### FUNCTIONS ####

sd_nMinusOne_to_n <- function(x, n) {
  var1 <- x^2
  sumsquares1 <- var1 * (n-1)
  return(sqrt(sumsquares1 / n))
}


#### dprime function ####

dprime <- function(hits, false_alarms, na.rm=TRUE) {
  #function to calculate d prime
  #hits: a vector of 0s and 1s
  #false_alarms: a vector of 0s and 1s
  hit_rate <- mean(hits, na.rm=na.rm) 
  if (hit_rate == 1) {
    hit_rate <- sum(hits, na.rm = T)/(length(hits[!is.na(hits)]) + 1) # if memory hits = 1, assume there was 1 more trial that was incorrect
  }
  false_alarm_rate <- mean(false_alarms, na.rm=na.rm)
  if (false_alarm_rate == 0) {
    false_alarm_rate <- sum(false_alarms, na.rm = T)+ 1/(length(false_alarms[!is.na(false_alarms)]) + 1) # if false alarms = 0, assume there was 1 more trial that was incorrect
  }
  dprime <- qnorm(hit_rate) - qnorm(false_alarm_rate)
  table_sdt = data.table(hit_rate, false_alarm_rate, dprime)
  return(table_sdt)
}


memory_hits <- function(hits, na.rm=TRUE) {
  memory_hits <- mean(hits, na.rm = na.rm)
  if (memory_hits == 1) {
    memory_hits <- sum(hits, na.rm = T)/(length(hits[!is.na(hits)]) + 1) # if memory hits = 1, assume there was 1 more trial that was incorrect
  }
  return(memory_hits)
}
