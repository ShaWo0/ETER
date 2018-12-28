df<-fromJSON("http://www.eter-project.com/api/3.0/HEIs/full")
write_json(df, "C:/temp/eter.json")

Pituus<- c(1:length(df))
fe <- flatten(df[[1]][["BAS"]])
fe <- fe[lapply(fe, length)>0]
names(fe) <- paste("BAS",names(fe), sep="_")

fe2 <- flatten(df[[1]][["GEO"]])
fe2 <- fe2[lapply(fe2, length)>0]


fe_df <- fe %>% as.data.frame()
colnames(fe_df) <- paste0("BAS_",colnames(fe_df))


fe_df<-as.data.frame(fe,row.names=NULL,optional=FALSE)

write.csv2(fe_df,"C:/temp/eter.csv",row.names = FALSE)

fl<-flatten(df[[1]],recursive=TRUE)
fl<-fl[lapply(fl, length)>0]
fl_df <- rbind_pages(flatten(fl))

rm(i)
