df1 <- head(df,2000)
df2 <- head(FullEter,100)
df3 <- as.matrix(df2)
df3 <- as.data.frame(df3)



##### Päivitä fromJSON ja muut check scriptissä olevat ja testaa alla oleva ####
bas_df <- as.data.frame(df1[["BAS"]])
geo_df <- as.data.frame(df1[["GEO"]]) %>% flatten()
exp_df <- df2[["EXP"]]  %>% as.data.frame()
rev_df <- as.data.frame(df1[["REV"]]) %>% flatten()
sta_df <- as.data.frame(df1[["STA"]]) %>% flatten()
stud_df <- as.data.frame(df1[["STUD"]]) %>% flatten()
grad_df <- as.data.frame(df1[["GRAD"]]) %>% flatten()
res_df <- as.data.frame(df1[["RES"]]) %>% flatten()
ind_df <- as.data.frame(df1[["IND"]]) %>% flatten()
demo_df <- as.data.frame(df1[["DEMO"]]) %>% flatten()
era_df <- as.data.frame(df1[["ERA"]]) %>% flatten()

exp_df2 <- names(exp_df)

write_csv2(bas_df,"C:/temp/R/bas.csv")
write_csv2(geo_df,"C:/temp/R/geo.csv")
write_csv2(exp_df,"C:/temp/R/exp.csv")
write_csv2(rev_df,"C:/temp/R/rev.csv")
write_csv2(sta_df,"C:/temp/R/sta.csv")
write_csv2(stud_df,"C:/temp/R/stud.csv")
write_csv2(grad_df,"C:/temp/R/grad.csv")
write_csv2(res_df,"C:/temp/R/res.csv")
write_csv2(ind_df,"C:/temp/R/ind.csv")
write_csv2(demo_df,"C:/temp/R/demo.csv")
write_csv2(era_df,"C:/temp/R/era.csv")
write_csv2(df3,"C:/temp/eter/fulleter_head100.csv")

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

rm(list=c("stud_df","stud_df_empty","stud_t","sta_df","sta_df_empty","sta_t",
          "rev_df","rev_df_empty","rev_t","res_df","res_df_empty","res_t","ind_df","ind_df_empty","ind_t",
          "grad_df","grad_df_empty","grad_t","geo_df","geo_df_empty","geo_t","era_df","era_df_empty","era_t",
          "demo_df","demo_df_empty","demo_t","bas_df","bas_df_empty","bas_t","exp_df","exp_df_empty","exp_t"))
