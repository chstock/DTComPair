# --------------------------------------------------------
# sesp.rel
# --------------------------------------------------------
#' Comparison of the accuracy of two tests using relative sensitivity and specificity
#' 
#' @description Calculates two-sided Wald confidence intervals and performs a Wald test for the relative
#' sensitivity and specificity of two binary diagnostic tests in a paired study design.
#' 
#' @param tab an object of class \code{tab.paired}.
#' @param alpha	significance level alpha used to compute two-sided 100(1-alpha)\%-confidence intervals, the default is 0.05.
#' 
#' @returns A list containing:
#' \item{sensitivity}{a named vector containing \code{test1} (the sensitivity for test 1), \code{test2} (the sensitivity for test 2), 
#' \code{rel.sens} (the relative difference between the two sensitivities, computed as \code{test2/test1}), 
#' \code{se.log.rel.sens} (the standard error for log(\code{rel.sens})), \code{lcl.rel.sens} (the lower confidence limit for \code{rel.sens}), 
#'  \code{ucl.rel.sens} (the upper confidence limit for \code{rel.sens}), and \code{pval.rel.sens} (the p-value from the test for
#'  the null hypothesis: relative sensitivity=1).}
#' \item{specificity}{a named vector containing \code{test1} (the specificity for test 1), \code{test2} (the specificity for test 2), 
#' \code{rel.spec} (the relative difference between the two specificities, computed as \code{test2/test1}), 
#' \code{se.log.rel.spec} (the standard error for log(\code{rel.spec})), \code{lcl.rel.spec} (the lower confidence limit for \code{rel.spec}), 
#'  \code{ucl.rel.spec} (the upper confidence limit for \code{rel.spec}), and \code{pval.rel.spec} (the p-value from the test for
#'  the null hypothesis: relative specificity=1).}
#' \item{alpha}{significance level alpha for 100(1-alpha)\%-confidence intervals for \code{rel.sens} and \code{rel.spec}.}
#' 
#' @details If relative sensitivity>1, the percentage increase in sensitivity for \code{test2} relative to \code{test1} is computed as 100(relative sensitivity-1)\%. If 
#' relative sensitivity<1 the percentage decrease in sensitivity for \code{test2} relative to \code{test1} is computed as 100(1-relative sensitivity)\%. 
#' Percentage increase/decrease in specificity is computed in an analogous fashion. 
#'
#' Given the independence of relative sensitivity and relative specificity, a possible joint 100(1-alpha)\% confidence region for \{relative sensitivity, relative specificity\}
#' is formed by the rectangle \{\code{lcl.rel.sens}, \code{ucl.rel.sens}\} x \{\code{lcl.rel.spec}, \code{ucl.rel.spec}\}, where \{\code{lcl.rel.sens}, \code{ucl.rel.sens}\} and
#' \{\code{lcl.rel.spec}, \code{ucl.rel.spec}\} are 100(1-alpha*)\% confidence intervals for relative sensitivity and relative specificity, respectively, and alpha*=1-sqrt(1-alpha).
#' 
#' The McNemar's test implemented in \code{sesp.mcnemar} is asymptotically equivalent to the Wald test implemented here.
#' 
#' @references Alonzo, T. A., Pepe, M. S., & Moskowitz, C. S. (2002). Sample size calculations for comparative studies of medical tests for detecting presence of disease. \emph{Statistics in medicine}, 21(6), 835-852.
#' 
#' @seealso \code{sesp.diff.ci}, \code{sesp.mcnemar}, and \code{sesp.exactbinom}.
#' 
#' @examples
#' data(Paired1) # Hypothetical study data
#' ftable(Paired1)
#' paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
#' paired.layout 
#' sesp.rel.results <- sesp.rel(paired.layout)
#' str(sesp.rel.results)
#' sesp.rel.results

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
