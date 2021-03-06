library(tidyr)
library(data.table)
library(dplyr)
library(reshape2)
library(gtools)

argv<-commandArgs(TRUE)

#argv <- gsub("\\,",replacement="\\,",argv)

getelementmatrix=function(...)
{
# x        <-c("animal","army")
# x        <-c("hunter","knife","missal")
# x        <-c("hunter","knife","missal","animal","army")
x        <-c(...)
x2       <-strsplit(x,split=",",fixed=T)
sumtable <-read.csv("D:/BigData_Document/Java_Doc/Dramaker/DramakerNEWR8/Rscript/summary.csv")
sumtable <-sumtable[order(sumtable$IMDB,decreasing = TRUE),]


#1.?��8符�? A&B&C
if(length(x2)==1){
moviename<-filter(sumtable,sumtable[,unlist(x2)[1]]=="Y")
}else if(length(x2)==2){
moviename<-filter(sumtable,sumtable[,unlist(x2)[1]]=="Y",sumtable[,unlist(x2)[2]]=="Y")
}else if(length(x2)==3){
moviename<-filter(sumtable,sumtable[,unlist(x2)[1]]=="Y",sumtable[,unlist(x2)[2]]=="Y",sumtable[,unlist(x2)[3]]=="Y")
}else if(length(x2)==4){
moviename<-filter(sumtable,sumtable[,unlist(x2)[1]]=="Y",sumtable[,unlist(x2)[2]]=="Y",sumtable[,unlist(x2)[3]]=="Y",sumtable[,unlist(x2)[4]]=="Y")
}else if(length(x2)==5){
  moviename<-filter(sumtable,sumtable[,unlist(x2)[1]]=="Y",sumtable[,unlist(x2)[2]]=="Y",sumtable[,unlist(x2)[3]]=="Y",sumtable[,unlist(x2)[4]]=="Y",sumtable[,unlist(x2)[5]]=="Y")
}else if(length(x2)==6){
  moviename<-filter(sumtable,sumtable[,unlist(x2)[1]]=="Y",sumtable[,unlist(x2)[2]]=="Y",sumtable[,unlist(x2)[3]]=="Y",sumtable[,unlist(x2)[4]]=="Y",sumtable[,unlist(x2)[5]]=="Y",sumtable[,unlist(x2)[6]]=="Y")
}



##2.?��??�改?�隨機�??w?
#2.1?w??��??��?
x2.random<-gtools::permute(unlist(x2))

#2.2檢查moviename?�否?�空??
movienameisna<-moviename[1:3,1][1]%>%as.character%>%is.na()

#2.3?��?檢查
if(length(x2)==1 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y")
}else if(length(x2)==2 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" | sumtable[,x2.random[2]]=="Y")
}else if(length(x2)==3 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" & sumtable[,x2.random[2]]=="Y")
}else if(length(x2)==4 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" & sumtable[,x2.random[2]]=="Y" & sumtable[,x2.random[3]]=="Y")
}else if(length(x2)==5 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" & sumtable[,x2.random[2]]=="Y" & sumtable[,x2.random[3]]=="Y")
}else if(length(x2)==6 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" & sumtable[,x2.random[2]]=="Y" & sumtable[,x2.random[3]]=="Y")
}


##3.以防?��?A|B|C
#3.1檢查moviename?�否?�空??
movienameisna<-moviename[1:3,1][1]%>%as.character%>%is.na()
#3.2?��?檢查
if(length(x2)==1 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y")
}else if(length(x2)==2 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" | sumtable[,x2.random[2]]=="Y")
}else if(length(x2)==3 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" | sumtable[,x2.random[2]]=="Y")
}else if(length(x2)==4 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" | sumtable[,x2.random[2]]=="Y" | sumtable[,x2.random[3]]=="Y")
}else if(length(x2)==5 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" | sumtable[,x2.random[2]]=="Y" | sumtable[,x2.random[3]]=="Y")
}else if(length(x2)==6 && movienameisna){
  moviename<-filter(sumtable,sumtable[,x2.random[1]]=="Y" | sumtable[,x2.random[2]]=="Y" | sumtable[,x2.random[3]]=="Y")
}


print(as.character(moviename[1:3,1]))

}


# getelementmatrix("hunter","knife","missal","animal","army")
getelementmatrix(argv)