# --------------------------------------------------------
# sesp.rel
# --------------------------------------------------------
sesp.rel <- function(tab, alpha) {
  # check arguments
  if (missing(tab)) stop("Table is missing.")
  if (!(inherits(x=tab, what="tab.paired", which=F))) 
    stop("Table must be of class 'tab.paired'")
  if (missing(alpha)) alpha <- 0.05
  # compute accuracy
  acc <- acc.paired(tab)  
  # sensitivity
  sens.1 <- acc$Test1$sensitivity["est"]; sens.2 <- acc$Test2$sensitivity["est"]
  rel.sens <- (sens.2/sens.1); names(rel.sens) <- NULL  
  # specificity
  spec.1 <- acc$Test1$specificity["est"]; spec.2 <- acc$Test2$specificity["est"]
  rel.spec <- (spec.2/spec.1); names(rel.spec) <- NULL
  # Wald confidence intervals
  # sensitivity
  a <- tab$diseased[1,1]; b <- tab$diseased[1,2]; c <- tab$diseased[2,1];
  se.log.rel.sens <- sqrt((b+c)/((a+b)*(a+c)))
  cl.rel.sens <- exp(log(rel.sens) + c(-1,1) * qnorm(1-alpha/2) * se.log.rel.sens)
  pval.rel.sens <- 2*(pnorm(-abs(log(rel.sens)/se.log.rel.sens)))
  # specificity
  a <- tab$non.diseased[2,2]; b <- tab$non.diseased[1,2]; c <- tab$non.diseased[2,1];
  se.log.rel.spec <- sqrt((b+c)/((a+b)*(a+c)))
  cl.rel.spec <- exp(log(rel.spec) + c(-1,1) * qnorm(1-alpha/2) * se.log.rel.spec)  
  pval.rel.spec <- 2*(pnorm(-abs(log(rel.spec)/se.log.rel.spec)))
  # results
  sensitivity <- c(sens.1, sens.2, rel.sens, se.log.rel.sens, cl.rel.sens, pval.rel.sens)
  names(sensitivity) <- c("test1","test2","rel.sens","se.log.rel.sens","lcl.rel.sens","ucl.rel.sens", "pval.rel.sens")
  specificity <- c(spec.1, spec.2, rel.spec, se.log.rel.spec, cl.rel.spec, pval.rel.spec)
  names(specificity) <- c("test1","test2","rel.spec","se.log.rel.spec","lcl.rel.spec","ucl.rel.spec","pval.rel.spec")
  results <- list(sensitivity, specificity, alpha)
  names(results) <- c("sensitivity","specificity","alpha")
  return(results)
}
