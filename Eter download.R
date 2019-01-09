
FullEter <- fromJSON("http://www.eter-project.com/api/3.0/HEIs/full")


#df <- fromJSON("C:/temp/eter.json")
#df <- fromJSON("C:/temp/R/eter.json")
#write_json(df, "C:/temp/eter.json")
#write_json(FullEter, "C:/temp/FullEter.json")
#write_json(df, "C:/temp/R/eter.json") 

#gethei <- fromJSON("http://www.eter-project.com/api/3.0/HEIs/getHEI?id=") #id kentästä df[[1]][["_id]], yksittäisen vuoden ja yhden korkeakoulun hakeminen

All_fields <- fromJSON("https://www.eter-project.com/api/3.0/field-groups/find/all-fields")
fields_pituus <- c(1:length(All_fields[[2]]))

bas_id <- All_fields[[2]][[1]][["id"]]
geo_id <- All_fields[[2]][[2]][["id"]]
exp_id <- All_fields[[2]][[3]][["id"]]
rev_id <- All_fields[[2]][[4]][["id"]]
sta_id <- All_fields[[2]][[5]][["id"]]
stud_id <- All_fields[[2]][[6]][["id"]]
grad_id <- All_fields[[2]][[7]][["id"]]
res_id <- All_fields[[2]][[8]][["id"]]
ind_id <- All_fields[[2]][[9]][["id"]]
demo_id <- All_fields[[2]][[10]][["id"]]
era_id <- All_fields[[2]][[11]][["id"]]

id_lista <- c(bas_id,geo_id,exp_id,rev_id,sta_id,stud_id,grad_id,res_id,ind_id,demo_id,era_id)


#VANHA VERSIO - luetaan kenttälistat ja tuodaan siitä rakenne#
#basdf <- fromJSON("https://www.eter-project.com/api/3.0/field-groups/find/all-fields")
#basdf <- basdf[[2]][[1]][["fieldIds"]]
#basdf <- str_sub(basdf,5)
#basdf <- as.data.frame(matrix(basdf, ncol = length(basdf), byrow = TRUE), stringsAsFactors = FALSE)
#basdf$id <- as.character("")
#colnames(basdf) <- basdf[1,]
#basdf <- basdf[0,]


# Ongelmien etsimistä
#bas42<-as.data.frame(as.matrix(df[[42]][["BAS"]]))
##bas42<-flatten(df[[42]][["BAS"]])
##bas42<-as.data.frame(as.matrix(bas42))
##bas42$V1 <- str_replace_all(bas42$V1,"[c][\\(][v ][|=|]","")
#bas42$V1 <- gsub("list\\(v \\= ","",bas42$V1)
#bas42$V1 <- gsub("c\\(v \\= ","",bas42$V1)
#bas42$V1 <- gsub("\\)","",bas42$V1)
#bas42 <- as.data.frame(t(bas42)) %>% mutate_all(as.character)
##bas42 <- bas42[,order(names(bas42))]
#bas42$id <- as.character(df[[42]][["_id"]])
#basdf<-rbind(basdf,bas42)
##basdf[nrow(basdf)+1,] <- c(bas42[1,])



#######       Luodaan tyhjä taulu id kentällä varustettuna
bas_df <- as.data.frame(matrix(names(df[[1]][["BAS"]]), ncol = length(df[[1]][["BAS"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(bas_df) <- bas_df[1,]
bas_df$id <- as.character("")
bas_df <- bas_df[-1,]
bas_df_empty <- bas_df

geo_df <- as.data.frame(matrix(names(df[[1]][["GEO"]]), ncol = length(df[[1]][["GEO"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(geo_df) <- geo_df[1,]
geo_df$id <- as.character("")
geo_df <- geo_df[-1,]
geo_df_empty <- geo_df

exp_df <- as.data.frame(matrix(names(df[[1]][["EXP"]]), ncol = length(df[[1]][["EXP"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(exp_df) <- exp_df[1,]
exp_df$id <- as.character("")
exp_df <- exp_df[-1,]
exp_df_empty <- exp_df

rev_df <- as.data.frame(matrix(names(df[[1]][["REV"]]), ncol = length(df[[1]][["REV"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(rev_df) <- rev_df[1,]
rev_df$id <- as.character("")
rev_df <- rev_df[-1,]
rev_df_empty <- rev_df

sta_df <- as.data.frame(matrix(names(df[[1]][["STA"]]), ncol = length(df[[1]][["STA"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(sta_df) <- sta_df[1,]
sta_df$id <- as.character("")
sta_df <- sta_df[-1,]
sta_df_empty <- sta_df

stud_df <- as.data.frame(matrix(names(df[[1]][["STUD"]]), ncol = length(df[[1]][["STUD"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(stud_df) <- stud_df[1,]
stud_df$id <- as.character("")
stud_df <- stud_df[-1,]
stud_df_empty <- stud_df

grad_df <- as.data.frame(matrix(names(df[[1]][["GRAD"]]), ncol = length(df[[1]][["GRAD"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(grad_df) <- grad_df[1,]
grad_df$id <- as.character("")
grad_df <- grad_df[-1,]
grad_df_empty <- grad_df

res_df <- as.data.frame(matrix(names(df[[1]][["RES"]]), ncol = length(df[[1]][["RES"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(res_df) <- res_df[1,]
res_df$id <- as.character("")
res_df <- res_df[-1,]
res_df_empty <- res_df

ind_df <- as.data.frame(matrix(names(df[[1]][["IND"]]), ncol = length(df[[1]][["IND"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(ind_df) <- ind_df[1,]
ind_df$id <- as.character("")
ind_df <- ind_df[-1,]
ind_df_empty <- ind_df

demo_df <- as.data.frame(matrix(names(df[[1]][["DEMO"]]), ncol = length(df[[1]][["DEMO"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(demo_df) <- demo_df[1,]
demo_df$id <- as.character("")
demo_df <- demo_df[-1,]
demo_df_empty <- demo_df

era_df <- as.data.frame(matrix(names(df[[1]][["ERA"]]), ncol = length(df[[1]][["ERA"]]), byrow = TRUE), stringsAsFactors = FALSE) %>% mutate_all(as.character)
colnames(era_df) <- era_df[1,]
era_df$id <- as.character("")
era_df <- era_df[-1,]
era_df_empty <- era_df

#tyhjennä taulut
bas_df <- bas_df_empty
geo_df <- geo_df_empty
exp_df <- exp_df_empty
rev_df <- rev_df_empty
sta_df <- sta_df_empty
stud_df <- stud_df_empty
grad_df <- grad_df_empty
res_df <- res_df_empty
ind_df <- ind_df_empty
demo_df <- demo_df_empty
era_df <- era_df_empty

Pituus <- c(1:length(df)) #Koko listan pituusmuuttuja
Pituus1 <- c(sample(1:length(df),500, replace=F)) #Testausta varten satunnaiset 1000 kenttää

Loopin_alku <- Sys.time() #Tallennetaan aikaa varten aloitusaika
for(i in Pituus1)
  {
    #Basic institutional descriptors
    bas_t<-df[[i]][["BAS"]]
    bas_t<-as.data.frame(as.matrix(bas_t))
    bas_t$V1 <- gsub("list\\(v \\= ","",bas_t$V1)
    bas_t$V1 <- gsub("c\\(v \\= ","",bas_t$V1)
    bas_t$V1 <- gsub("\\)","",bas_t$V1)
    bas_t<-as.data.frame(t(bas_t)) %>% mutate_all(as.character)
    bas_t$id <- as.character(df[[i]][["_id"]])
    bas_df<-rbind(bas_df,bas_t)
    
    #Geographic information
    geo_t<-df[[i]][["GEO"]]
    geo_t<-as.data.frame(as.matrix(geo_t))
    geo_t$V1 <- gsub("list\\(v \\= ","",geo_t$V1)
    geo_t$V1 <- gsub("c\\(v \\= ","",geo_t$V1)
    geo_t$V1 <- gsub("\\)","",geo_t$V1)
    geo_t<-as.data.frame(t(geo_t)) %>% mutate_all(as.character)
    geo_t$id <- as.character(df[[i]][["_id"]])
    geo_df<-rbind(geo_df,geo_t)
    
    
    #Expenditures
    exp_t<-df[[i]][["EXP"]]
    exp_t<-as.data.frame(as.matrix(exp_t))
    exp_t$V1 <- gsub("list\\(v \\= ","",exp_t$V1)
    exp_t$V1 <- gsub("c\\(v \\= ","",exp_t$V1)
    exp_t$V1 <- gsub("\\)","",exp_t$V1)
    exp_t<-as.data.frame(t(exp_t)) %>% mutate_all(as.character)
    exp_t$id <- as.character(df[[i]][["_id"]])
    exp_df<-rbind(exp_df,exp_t)
    
    #Revenues
    rev_t<-df[[i]][["REV"]]
    rev_t<-as.data.frame(as.matrix(rev_t))
    rev_t$V1 <- gsub("list\\(v \\= ","",rev_t$V1)
    rev_t$V1 <- gsub("c\\(v \\= ","",rev_t$V1)
    rev_t$V1 <- gsub("\\)","",rev_t$V1)
    rev_t<-as.data.frame(t(rev_t)) %>% mutate_all(as.character)
    rev_t$id <- as.character(df[[i]][["_id"]])
    rev_df<-rbind(rev_df,rev_t)
    
    #Staff
    sta_t<-df[[i]][["STA"]]
    sta_t<-as.data.frame(as.matrix(sta_t))
    sta_t$V1 <- gsub("list\\(v \\= ","",sta_t$V1)
    sta_t$V1 <- gsub("c\\(v \\= ","",sta_t$V1)
    sta_t$V1 <- gsub("\\)","",sta_t$V1)
    sta_t<-as.data.frame(t(sta_t)) %>% mutate_all(as.character)
    sta_t$id <- as.character(df[[i]][["_id"]])
    sta_df<-rbind(sta_df,sta_t)
    
    #Education - students
    stud_t<-df[[i]][["STUD"]]
    stud_t<-as.data.frame(as.matrix(stud_t))
    stud_t$V1 <- gsub("list\\(v \\= ","",stud_t$V1)
    stud_t$V1 <- gsub("c\\(v \\= ","",stud_t$V1)
    stud_t$V1 <- gsub("\\)","",stud_t$V1)
    stud_t<-as.data.frame(t(stud_t)) %>% mutate_all(as.character)
    stud_t$id <- as.character(df[[i]][["_id"]])
    stud_df<-rbind(stud_df,stud_t)
    
    #Education - graduates
    grad_t<-df[[i]][["GRAD"]]
    grad_t<-as.data.frame(as.matrix(grad_t))
    grad_t$V1 <- gsub("list\\(v \\= ","",grad_t$V1)
    grad_t$V1 <- gsub("c\\(v \\= ","",grad_t$V1)
    grad_t$V1 <- gsub("\\)","",grad_t$V1)
    grad_t<-as.data.frame(t(grad_t)) %>% mutate_all(as.character)
    grad_t$id <- as.character(df[[i]][["_id"]])
    grad_df<-rbind(grad_df,grad_t)
    
    #Research
    res_t<-df[[i]][["RES"]]
    res_t<-as.data.frame(as.matrix(res_t))
    res_t$V1 <- gsub("list\\(v \\= ","",res_t$V1)
    res_t$V1 <- gsub("c\\(v \\= ","",res_t$V1)
    res_t$V1 <- gsub("\\)","",res_t$V1)
    res_t<-as.data.frame(t(res_t)) %>% mutate_all(as.character)
    res_t$id <- as.character(df[[i]][["_id"]])
    res_df<-rbind(res_df,res_t)
    
    #Indicators
    ind_t<-df[[i]][["IND"]]
    ind_t<-as.data.frame(as.matrix(ind_t))
    ind_t$V1 <- gsub("list\\(v \\= ","",ind_t$V1)
    ind_t$V1 <- gsub("c\\(v \\= ","",ind_t$V1)
    ind_t$V1 <- gsub("\\)","",ind_t$V1)
    ind_t<-as.data.frame(t(ind_t)) %>% mutate_all(as.character)
    ind_t$id <- as.character(df[[i]][["_id"]])
    ind_df<-rbind(ind_df,ind_t)
    
    #Demographic events
    demo_t<-df[[i]][["DEMO"]]
    demo_t<-as.data.frame(as.matrix(demo_t))
    demo_t$V1 <- gsub("list\\(v \\= ","",demo_t$V1)
    demo_t$V1 <- gsub("c\\(v \\= ","",demo_t$V1)
    demo_t$V1 <- gsub("\\)","",demo_t$V1)
    demo_t<-as.data.frame(t(demo_t)) %>% mutate_all(as.character)
    demo_t$id <- as.character(df[[i]][["_id"]])
    demo_df<-rbind(demo_df,demo_t)
    
    #Erasmus data
    era_t<-df[[i]][["ERA"]]
    era_t<-as.data.frame(as.matrix(era_t))
    era_t$V1 <- gsub("list\\(v \\= ","",era_t$V1)
    era_t$V1 <- gsub("c\\(v \\= ","",era_t$V1)
    era_t$V1 <- gsub("\\)","",era_t$V1)
    era_t<-as.data.frame(t(era_t)) %>% mutate_all(as.character)
    era_t$id <- as.character(df[[i]][["_id"]])
    era_df<-rbind(era_df,era_t)
    
    print(paste("Lisätty rivi: ",0+i))
  }

write.csv2(bas_df,"C:/temp/eter_bas.csv",row.names = FALSE)
print("Kirjoitettu eter_bas.csv")
write.csv2(geo_df,"C:/temp/eter_geo.csv",row.names = FALSE)
print("Kirjoitettu eter_geo.csv")
write.csv2(exp_df,"C:/temp/eter_exp.csv",row.names = FALSE)
print("Kirjoitettu eter_exp.csv")
write.csv2(rev_df,"C:/temp/eter_rev.csv",row.names = FALSE)
print("Kirjoitettu eter_rev.csv")
write.csv2(sta_df,"C:/temp/eter_sta.csv",row.names = FALSE)
print("Kirjoitettu eter_sta.csv")
write.csv2(stud_df,"C:/temp/eter_stud.csv",row.names = FALSE)
print("Kirjoitettu eter_stud.csv")
write.csv2(grad_df,"C:/temp/eter_grad.csv",row.names = FALSE)
print("Kirjoitettu eter_grad.csv")
write.csv2(res_df,"C:/temp/eter_res.csv",row.names = FALSE)
print("Kirjoitettu eter_res.csv")
write.csv2(ind_df,"C:/temp/eter_ind.csv",row.names = FALSE)
print("Kirjoitettu eter_ind.csv")
write.csv2(demo_df,"C:/temp/eter_demo.csv",row.names = FALSE)
print("Kirjoitettu eter_demo.csv")
write.csv2(era_df,"C:/temp/eter_era.csv",row.names = FALSE)
print("Kirjoitettu eter_era.csv")

Loopin_loppu <- Sys.time() #Tallennetaan aikaa varten lopetusaika
Kesto <- Loopin_loppu-Loopin_alku
print(paste("Ajaminen kesti ",Kesto)) 


#rm(list=c("a","b","BAS","bas","BAS_t","bas17df","bas42","l","tempdf","tempdf18","tempdf2","TRA","bas17","bas_18"))
#rm(list=c(bas_df,geo_df,era_df,exp_df,grad_df,ind_df,res_df,rev_df,sta_df,stud_df)) #poista data framet 
#rm(list=c(bas_t,geo_t,era_t,exp_t,grad_t,ind_t,res_t,rev_t,sta_t,stud_t)) #poista temp data framet
#rm(list=c("demo_id","era_id","exp_id","geo_id","grad_id","i","id_lista","ind_id","PI","Pituus","Pituus1","res_id","rev_id","sta_id","stud_id"))

