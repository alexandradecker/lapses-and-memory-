# lapses-and-memory-


# README

This readme contains documentation for the dataset. In this study, we looked at how fluctuations in attention influenced moment to moment changes in memory in children and adults. 

You will need the following packages to run the code:
hausekeep
mediation
roll
broom
lme4
lmerTest
dplyr
data.table
ggplot2
dtplyr
tidyr
reshape2
ggbeeswarm
tidyverse
tibble
optimx
Hmisc
DescTools
lm.beta
zoo
imputeTS
ggsignif 
sjPlot 
sjmisc 
sjlabelled 
modelsummary

## Encoding

The encoding.csv file contains data from the encoding session of the task. 


### Headings
- Participant: the participant number
- trialNo: trial number
- stimulus: name of the stimulus
- classifyEnc: whether the image was from the nonliving category or living category
- resp: the keyboard response of the participant
- rt: time particpants took to respond to stimulus from stimulus onset
- acc: whether the participant accurately classified the image as living or nonliving
- age: age of participant
- handedness: left or right handed
- group: child or adult


## Recognition file
The recognition_test.csv file contains data from the recognition phase. 
### Headings
- Participant: the participant number
- trialNo: trial number
- stimulus: name of the stimulus
- classifyEnc: whether the image was from the nonliving category or living category
- classifyMemory: whether the image was old (presented in the encoding phase) or new
- choiceMemory: whether the participant indicated the image was old or new
- rt: time particpants took to respond to the old new judgement
- acc: whether the participants response was accurate
- age: age of participant
- ratingRT: time to rate confidence of memory decision
- ratingConfidence: participants' rating of their memory decision


