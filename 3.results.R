
source('1.clean.R')
source('2.methods.R')

# save results
results <- cbind(unadj=p,bonf,holm,hoch,romwolf,benjhoch,benjyek)
rownames(results) <- c('constant', names(data)[2:length(names(data))])
results <- round(results, digits=3)

# print results
results                   # p-values
colSums(results<.05)      # number of significant variables

# print knockoff results
print(knoff)

# LaTeX table
xtable(results)