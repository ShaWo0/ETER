ind_df <- as.data.frame(matrix(names(unlist(df[[1]][["IND"]])), ncol = length(unlist(df[[1]][["IND"]])), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(ind_df) <- ind_df[1,]
ind_df$id <- as.character("")
ind_df <- ind_df[-1,]
ind_df_empty <- ind_df

ind_df<-ind_df_empty

Pituus1 <- c(sample(1:length(df),100, replace=F)) #Testausta varten satunnaiset x kenttää

for (i in Pituus1){
  ind_t<-df[[i]][["IND"]]
  ind_t <- ind_t %>% unlist() %>% as.matrix() %>% as.data.frame()
  #ind_t<-as.data.frame(as.matrix(ind_t))
  
  ind_t$V1 <- gsub("list\\(v \\= ","",ind_t$V1)
  ind_t$V1 <- gsub("c\\(v \\= ","",ind_t$V1)
  ind_t$V1 <- gsub("\\)","",ind_t$V1)
  ind_t<-as.data.frame(t(ind_t)) %>% mutate_all(as.character)
  ind_t$id <- as.character(df[[i]][["_id"]])
  ind_df<-rbind(ind_df,ind_t)
}

ind_t<-df[[1]][["IND"]]
ind_t <- ind_t %>% unlist() %>% t() %>% as.matrix() %>% as.data.frame()
#ind_t<-as.data.frame(as.matrix(t(unlist(ind_t))))



ind_t$V1 <- gsub("list\\(v \\= ","",ind_t$V1)
ind_t$V1 <- gsub("c\\(v \\= ","",ind_t$V1)
ind_t$V1 <- gsub("\\)","",ind_t$V1)
ind_t<-as.data.frame(t(ind_t)) %>% mutate_all(as.character)
ind_t$id <- as.character(df[[i]][["_id"]])
ind_df<-rbind(ind_df,ind_t)