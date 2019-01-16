# Pakettien asennus ja aktivointi #
install.packages("tidyverse", dependencies = T)
install.packages("readr", dependencies = T)
install.packages("dplyr")
install.packages("plyr")
install.packages("knitr")
install.packages("stringr")
install.packages("R6")
install.packages("jsonlite")
install.packages("plotly",dependencies = T)
install.packages("ggplot2")
install.packages("rjstat", dependencies = T)
install.packages("rJava", dependencies = T)

library(dplyr)
library(ggplot2)
library(tidyr)
library(readr)
library(knitr)
library(jsonlite)
library(plotly)
library(tidyverse)
library(R6)
library(stringr)
library(rjstat)
library(rJava)

# Luetaan mitkä paketit asennettuna ja aktivoidaan ne
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip %>% filter(ip$Priority=='recommended'|is.na(ip$Priority)) #vanha versio: #ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
ip$Priority <- replace_na(ip$Priority,"User installed")
print(ip, row.names=FALSE)

kaikki_paketit<- as.list(as.character(ip[,1])) #paketit[,1]
pituus3 <- c(1:length(kaikki_paketit))
for (i in pituus3){
  tryCatch({
    library(kaikki_paketit[[i]],character.only = T, lib.loc = kansio)
    print(paste("paketti",i,":",kaikki_paketit[[i]]," asennettu"))
    
  },error=function(e){cat("Virhe:",conditionMessage(e), "\n")})
}







# Luetaan mitkä paketit käyttäjä on asentanut
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip %>% filter(ip$Priority=='recommended'|is.na(ip$Priority)) #vanha versio: #ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
ip$Priority <- replace_na(ip$Priority,"User installed")
print(ip, row.names=FALSE)

#write.csv2(ip,"C:/temp/R-asennetut_paketit.csv",row.names = F)
#install.packages(ip)

kansio <- "C:/R-3.5.1/library"

paketit <- read.csv2("c:/temp/R-asennetut_paketit_dwitvipuint.csv", header = T, sep = ";")
x<- as.character(paketit[,1]) #paketit[,1]
install.packages(x, depencies=T, lib=kansio)
x<- as.list(as.character(paketit[,1])) #paketit[,1]
pituus <- c(1:length(x))

for (i in pituus){
  tryCatch({
    library(x[[i]],character.only = T, lib.loc = kansio)
    print(paste("paketti:",x[[i]]," asennettu"))
    
  },error=function(e){cat("Virhe:",conditionMessage(e), "\n")})
}

#asennetaan muutama lis?paketti, jotka puuttuivat tai failasivat edellisess?.
#Lis?? additional muuttujaan paketteja joita tarvitset ja aja alla oleva uudelleen

additional <- c("tidyverse","ggplot2")
install.packages(additional,dependencies = T, lib=kansio)
additional <- as.list(additional)
pituus2 <- c(1:length(additional))
for (i in pituus2){
  tryCatch({
    library(additional[[i]],character.only = T, lib.loc = kansio)
    print(paste("paketti:",x[[i]]," asennettu"))
    
  },error=function(e){cat("Virhe:",conditionMessage(e), "\n")})
}

##### Viimeisin versio #####


kansio <- "C:/R-3.5.2/library"
# Luetaan mitkä paketit asennettuna ja aktivoidaan ne
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip %>% filter(ip$Priority=='recommended'|is.na(ip$Priority)) #vanha versio: #ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
ip$Priority <- replace_na(ip$Priority,"User installed")
#print(ip, row.names=FALSE) #Käytä tätä jos haluat nähdä listan paketeista ja versioista

kaikki_paketit<- as.list(as.character(ip[,1])) #paketit[,1]
paketti_pituus <- c(1:length(kaikki_paketit))
for (i in paketti_pituus){
  tryCatch({
    library(kaikki_paketit[[i]],character.only = T, lib.loc = kansio)
    print(paste("paketti",i,":",kaikki_paketit[[i]]," asennettu"))
    
  },error=function(e){cat("Virhe:",conditionMessage(e), "\n")})
}
unlist(kaikki_paketit)
rm(list=c("kansio","ip","kaikki_paketit","paketti_pituus","i")) 
print("Packets loaded, environment cleaned")

#### Update ####
update.packages("jsonlite")
