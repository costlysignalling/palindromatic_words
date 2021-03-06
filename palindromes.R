#Load the data as a vector
d<-read.table("words_czech_ANSI.txt") #for czech
#d<-read.table("words_alpha.txt")     #for english

v<-as.character(d[,1])

length(v)

palindrome<-function(string){
  splitted<-strsplit(string,"")
  paste(rev(splitted[[1]]),collapse="")
}

pal<-c(sapply(v,palindrome))

d<-data.frame(v=v,v2=pal)
d$first<-1:nrow(d)
d$second<-match(d$v,d$v2)
d<-d[!is.na(d$second),]
head(d)
d<-d[d$first<=d$second,]
d$palindromatic<-ifelse(d$first==d$second,T,F)

nrow(d)
sum(d$palindromatic)

write.table(d,"palindromatic_czech.txt",sep="\t",row.names = F)
#write.table(d,"palindromatic_english.txt",sep="\t",row.names = F)



