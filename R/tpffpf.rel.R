# --------------------------------------------------------
# tpffpf.rel
# --------------------------------------------------------
tpffpf.rel <- function(tab, alpha) {
  # check arguments
  if (missing(tab)) stop("Table is missing.")
  if (!(inherits(x=tab, what="tab.paired", which=F))) 
    stop("Table must be of class 'tab.paired'")
  if (missing(alpha)) alpha <- 0.05
  # relative TPF (sensitivity)
  a <- tab$diseased[1,1]; b <- tab$diseased[1,2]; c <- tab$diseased[2,1];
  rel.tpf <- (a+b)/(a+c)
  se.log.rel.tpf <- sqrt((b+c)/((a+b)*(a+c)))
  cl.rel.tpf <- exp(log(rel.tpf) + c(-1,1) * qnorm(1-alpha/2) * se.log.rel.tpf)
  pval.rel.tpf <- 2*(pnorm(-abs(log(rel.tpf)/se.log.rel.tpf)))
  # relative FPF (1-specificity)
  a <- tab$non.diseased[1,1]; b <- tab$non.diseased[1,2]; c <- tab$non.diseased[2,1];
  rel.fpf <- (a+b)/(a+c)
  se.log.rel.fpf <- sqrt((b+c)/((a+b)*(a+c)))
  cl.rel.fpf <- exp(log(rel.fpf) + c(-1,1) * qnorm(1-alpha/2) * se.log.rel.fpf)
  pval.rel.fpf <- 2*(pnorm(-abs(log(rel.fpf)/se.log.rel.fpf)))
  # results
  tpf <- c(rel.tpf, se.log.rel.tpf, cl.rel.tpf, pval.rel.tpf)
  names(tpf) <- c("rel.tpf","se.log.rel.tpf","lcl.rel.tpf","ucl.rel.tpf","pval.rel.tpf")
  fpf <- c(rel.fpf, se.log.rel.fpf, cl.rel.fpf, pval.rel.fpf)
  names(fpf) <- c("rel.fpf","se.log.rel.fpf","lcl.rel.fpf","ucl.rel.fpf","pval.rel.fpf")
  results <- list(tpf, fpf, alpha)
  names(results) <- c("tpf","fpf","alpha")
  return(results)
}
