
df<-fromJSON("http://www.eter-project.com/api/3.0/HEIs/full")
#df <- fromJSON("C:/temp/eter.json")
write_json(df, "C:/temp/eter.json")

gethei <- fromJSON("http://www.eter-project.com/api/3.0/HEIs/getHEI?id=") #id kentästä df[[1]][["_id]]


Pituus<- c(1:length(df))
PI <- c(1:5)

# Basic institutional descriptors

#VANHA VERSIO#
#basdf <- fromJSON("https://www.eter-project.com/api/3.0/field-groups/find/all-fields")
#basdf <- basdf[[2]][[1]][["fieldIds"]]
#basdf <- str_sub(basdf,5)
#basdf <- as.data.frame(matrix(basdf, ncol = length(basdf), byrow = TRUE), stringsAsFactors = FALSE)
#basdf$id <- as.character("")
#colnames(basdf) <- basdf[1,]
#basdf <- basdf[0,]


basdf <- as.data.frame(matrix(names(df[[1]][["BAS"]]), ncol = length(df[[1]][["BAS"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(basdf) <- basdf[1,]
#basdf<-basdf[,order(names(basdf))]
basdf$id <- as.character("")
basdf <- basdf[-1,]

bas42<-as.data.frame(as.matrix(df[[42]][["BAS"]]))
#bas42<-flatten(df[[42]][["BAS"]])
#bas42<-as.data.frame(as.matrix(bas42))
#bas42$V1 <- str_replace_all(bas42$V1,"[c][\\(][v ][|=|]","")
bas42$V1 <- gsub("list\\(v \\= ","",bas42$V1)
bas42$V1 <- gsub("c\\(v \\= ","",bas42$V1)
bas42$V1 <- gsub("\\)","",bas42$V1)
bas42 <- as.data.frame(t(bas42)) %>% mutate_all(as.character)
#bas42 <- bas42[,order(names(bas42))]
bas42$id <- as.character(df[[42]][["_id"]])
basdf<-rbind(basdf,bas42)
#basdf[nrow(basdf)+1,] <- c(bas42[1,])


Pituus<- c(1:length(df))
for(i in Pituus)
  {
  
    bas_t<-df[[i]][["BAS"]]
    bas_t<-as.data.frame(as.matrix(bas_t))
    bas_t$V1 <- gsub("list\\(v \\= ","",bas_t$V1)
    bas_t$V1 <- gsub("c\\(v \\= ","",bas_t$V1)
    bas_t$V1 <- gsub("\\)","",bas_t$V1)
    bas_t<-as.data.frame(t(bas_t)) %>% mutate_all(as.character)
    bas_t$id <- as.character(df[[i]][["_id"]])
    
    basdf<-rbind(basdf,bas_t)
    print(paste("Lisätty rivi: ",0+i))
  }

basdf <- basdf[,c(24,c(1:23))]



fe2 <- flatten(df[[1]][["GEO"]])
fe2 <- fe2[lapply(fe2, length)>0]


fe_df <- fe %>% as.data.frame()
colnames(fe_df) <- paste0("BAS_",colnames(fe_df))


fe_df<-as.data.frame(fe,row.names=NULL,optional=FALSE)

write.csv2(fe_df,"C:/temp/eter.csv",row.names = FALSE)

fl<-flatten(df[[1]],recursive=TRUE)
fl<-fl[lapply(fl, length)>0]
fl_df <- rbind_pages(flatten(fl))

rm(list=c("fe","fe2"))
rm(bas_fl1)

BAS_t <- c(1:length(flatten(df[[1]][["BAS"]])))
BAS_t <- flatten(df[[1]][["BAS"]])
BAS_t <- BAS_t[lapply(BAS_t, length)>0]
tempdf <- BAS_t %>% as.data.frame() %>% mutate_all(as.character)
tempdf$id <- df[[1]][["_id"]]
basdf <- rbind(basdf,tempdf)
