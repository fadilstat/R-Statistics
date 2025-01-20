# The normality test for a single variable using R
Function Statistic using R

```R
source("https://shorturl.at/wdyfZ")
set.seed(80)

n <- 100
x <- rnorm(n)

normal.text(x, info = F)
```

Output:

```R
#               Motode  Statistik   p-value  Keptusan
# D Kolmogorov-Smirnov 0.06317876 0.8196102 Terima H0
# W       Shapiro-Wilk 0.98436438 0.2855246 Terima H0
```
