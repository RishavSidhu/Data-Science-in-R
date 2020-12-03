library(recommenderlab)

cr <- read.csv("courserating.csv", header = TRUE)
head(cr)

R<-as.matrix(cr)
R
r <- as(R, "realRatingMatrix")
r

IB.Rec <- Recommender(r, "IBCF")

en <- cr[4,]

en
enm<- as.matrix(en)
enm
enr <- as(enm, "realRatingMatrix")
enr

pred <- predict(IB.Rec, enr, type="ratings")
as(pred, "matrix")
