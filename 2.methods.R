# run OLS model to get unadjusted p-values
m1 <- lm(survived ~ . , data=data)
p <- tidy(m1) %>% select(p.value) %>% unlist()
names(p) <- NULL
round(p, digits = 3)

# calculate fwer adjusted p-values
bonf <- p.adjust(p, method = 'bonferroni')
holm <- p.adjust(p, method = 'holm')
hoch <- p.adjust(p, method = 'hochberg')
romwolf <- p_adjust(m1, method = 'RW', B = 1000)
romwolf <- romwolf[,2]
names(romwolf) <- NULL

# calculate fdr adjusted p-values
benjhoch <- p.adjust(p, method = 'BH')
benjyek <- p.adjust(p, method = 'BY')

# knockoffs
x <- data[-1]
y <- data$survived
knoff <- knockoff.filter(x, y, fdr = .1)