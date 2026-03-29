options(scipen=999)
library(coin)

# load data
data = read.csv("measures.csv")
data$subjectID = factor(data$subjectID)
data$condition = factor(data$condition)

# accuracy
cat("\n=== ACCURACY ===\n")
print(kruskal_test(accuracy ~ condition, data=data, distribution="asymptotic"))
e.n = wilcox.test(data[data$condition == "with-citation",]$accuracy, data[data$condition == "without-explanation",]$accuracy, exact=FALSE)
c.n = wilcox.test(data[data$condition == "with-code",]$accuracy, data[data$condition == "without-explanation",]$accuracy, exact=FALSE)
e.c = wilcox.test(data[data$condition == "with-citation",]$accuracy, data[data$condition == "with-code",]$accuracy, exact=FALSE)
cat("Pairwise p-values (Holm): citation-none, code-none, citation-code\n")
print(p.adjust(c(e.n$p.value, c.n$p.value, e.c$p.value), method="holm"))

# reliability
cat("\n=== RELIABILITY ===\n")
print(kruskal_test(reliability ~ condition, data=data, distribution="asymptotic"))
e.n = wilcox.test(data[data$condition == "with-citation",]$reliability, data[data$condition == "without-explanation",]$reliability, exact=FALSE)
c.n = wilcox.test(data[data$condition == "with-code",]$reliability, data[data$condition == "without-explanation",]$reliability, exact=FALSE)
e.c = wilcox.test(data[data$condition == "with-citation",]$reliability, data[data$condition == "with-code",]$reliability, exact=FALSE)
cat("Pairwise p-values (Holm): citation-none, code-none, citation-code\n")
print(p.adjust(c(e.n$p.value, c.n$p.value, e.c$p.value), method="holm"))

# understanding
cat("\n=== UNDERSTANDING ===\n")
print(kruskal_test(understanding ~ condition, data=data, distribution="asymptotic"))
e.n = wilcox.test(data[data$condition == "with-citation",]$understanding, data[data$condition == "without-explanation",]$understanding, exact=FALSE)
c.n = wilcox.test(data[data$condition == "with-code",]$understanding, data[data$condition == "without-explanation",]$understanding, exact=FALSE)
e.c = wilcox.test(data[data$condition == "with-citation",]$understanding, data[data$condition == "with-code",]$understanding, exact=FALSE)
cat("Pairwise p-values (Holm): citation-none, code-none, citation-code\n")
print(p.adjust(c(e.n$p.value, c.n$p.value, e.c$p.value), method="holm"))
