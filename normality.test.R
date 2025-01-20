## ============================================================================================== ##
## DF-code: Normality Test
## DF-date: 2025-01-21
## ============================================================================================== ##


## Ket:
#' Method = "ks" : Kolmogorov-Smirnov
#' method = "sw" : Shapiro-Wilk

## Normality test
## ============================================================================================== ##
setClass("NormalTest",slots = list(output = "ANY"))
setMethod("initialize", "NormalTest", function(.Object, data, alpha, method, info){
  x <- unique(scale(as.vector(data)))
  
  # motode
  km <- ks.test(x,'pnorm') # Kolmogorov-Smirnov
  sp <- shapiro.test(x)    # Shapiro-Wilk
  
  ket     <- c()
  p_value <- c(km$p.value, sp$p.value)
  stat    <- c(km$statistic, sp$statistic)
  ket[1]  <- ifelse(p_value[1] < alpha,'Tolak H0','Terima H0')
  ket[2]  <- ifelse(p_value[2] < alpha,'Tolak H0','Terima H0')
  
  hasil <- data.frame(
    uji = c('Kolmogorov-Smirnov', 'Shapiro-Wilk'),
    stat,
    p_value,
    ket
  )
  
  colnames(hasil) <- c('Motode', 'Statistik','p-value','Keptusan')
  
  if(info){
    message('Hipotesis:')
    cat('H0 : Data mengikuti distribusi normal\n')
    cat('H1 : Data tidak mengikuti distribusi normal\n')
    message('\nStatistik Uji:')
    print(hasil)
    message('\nKeputusan:')
    
    cat('Kolmogorov-Smirnov: ')
    if(p_value[1] < alpha){cat('Data tidak mengikuti distribusi normal\n')}else{cat('Data mengikuti distribusi normal\n')}
    cat('Shapiro-Wilk      : ')
    if(p_value[2] < alpha){cat('Data tidak mengikuti distribusi normal\n')}else{cat('Data mengikuti distribusi normal\n')}
  }
  
  
  .Object@output <- hasil
  
  return(.Object)
})
normal.text <- function(data, alpha = 0.05, method=c("ks","sw"), info = T){
  new("NormalTest", data, alpha, method, info)@output
}
## ============================================================================================== ##