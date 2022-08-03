setwd('/Users/vyasenov/Library/CloudStorage/OneDrive-Adobe/GitHub/personal/multiple-testing-methods-comparison')

source('1.clean.R')
source('2.methods.R')

# print results
results <- cbind(unadj=p,bonf,holm,hoch,romwolf,benjhoch,benjyek)
results <- round(results, digits=3)
results

print(knoff)