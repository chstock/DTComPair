# --------------------------------------------------------
# tpffpf.rel
# --------------------------------------------------------
#' Comparison of the accuracy of two tests using relative true positive and false positive fraction
#' 
#' @description Calculates two-sided Wald confidence intervals and performs a Wald test for the relative
#' true positive fraction (TPF) (sensitivity) and false positive fraction (FPF) (i.e., one minus specificity) 
#' of two binary diagnostic tests in a paired study design.
#' 
#' This function is primarily intended for the analysis of paired \bold{screen positive} studies, i.e. those paired studies where
#' the disease (outcome) is ascertained using the gold standard test only in subjects who screen positive to 
#' either or both diagnostic tests. However, this function can also be used with data from standard paired studies, 
#' i.e. where the gold standard test is applied to all subjects.
#' 
#' 
#' @inheritParams sesp.rel
#' 
#' @returns A list containing:
#' \item{tpf}{a named vector containing 
#' \code{rel.tpf} (the relative true positive fraction, Test2 vs. Test1), 
#' \code{se.log.rel.tpf} (the standard error for log(\code{rel.tpf})), \code{lcl.rel.tpf} (the lower confidence limit for \code{rel.tpf}), 
#'  \code{ucl.rel.tpf} (the upper confidence limit for \code{rel.tpf}), and \code{pval.rel.tpf} (the p-value from the test for
#'  the null hypothesis: relative true positive fraction=1).}
#' \item{fpf}{a named vector containing 
#' \code{rel.fpf} (the relative false positive fraction, Test2 vs. Test1), 
#' \code{se.log.rel.fpf} (the standard error for log(\code{rel.fpf})), \code{lcl.rel.fpf} (the lower confidence limit for \code{rel.fpf}), 
#'  \code{ucl.rel.fpf} (the upper confidence limit for \code{rel.fpf}), and \code{pval.rel.fpf} (the p-value from the test for
#'  the null hypothesis: relative false positive fraction=1).}
#' \item{alpha}{significance level alpha for 100(1-alpha)\%-confidence intervals for \code{rel.tpf} and \code{rel.fpf}.}
#' 
#' @details If relative true positive fraction>1, the percentage increase in true positive fraction for Test2 relative to Test1 is computed as 100(relative true positive fraction-1)\%. If 
#' relative true positive fraction<1 the percentage decrease in true positive fraction for Test2 relative to Test1 is computed as 100(1-relative true positive fraction)\%. 
#' Percentage increase/decrease in false positive fraction is computed in an analogous fashion. 
#' 
#' Given the independence of relative TPR and relative TNR, a possible joint 100(1-alpha)\% confidence region for \{relative TPF, relative FPF\}
#' is formed by the rectangle \{\code{lcl.rel.tpf}, \code{ucl.rel.tpf}\} x \{\code{lcl.rel.fpf}, \code{ucl.rel.fpf}\}, where \{\code{lcl.rel.tpf}, \code{ucl.rel.tpf}\} and
#' \{\code{lcl.rel.fpf}, \code{ucl.rel.fpf}\} are 100(1-alpha*)\% confidence intervals for relative TPF and relative FPF, respectively, and alpha*=1-sqrt(1-alpha).
#'
#' In screen positive studies, only relative TPF and relative FPF can be estimated from the data. 
#' Their constituents, i.e. TPF and FPF for the two tests, are not estimable. 
#' Relative specificity is not estimable either. Therefore, \code{sesp.rel} should not 
#' be used to attempt to estimate those quantities from studies with a paired screen positive design. 
#' McNemar's test (\code{sesp.mcnemar}) can, however, be used to test the null hypothesis of equality in specificities in 
#' paired screen positive studies (Schatzkin et al., 1987).
#' 
#' @references Schatzkin, A., Connor, R. J., Taylor, P. R., & Bunnag, B. (1987). Comparing new and old screening tests when a reference procedure cannot be performed on all screenees: example of automated cytometry for early detection of cervical cancer. \emph{American Journal of Epidemiology}, 125(4), 672-678.
#' 
#' Cheng, H., & Macaluso, M. (1997). Comparison of the accuracy of two tests with a confirmatory procedure limited to positive results. \emph{Epidemiology}, 104-106.
#' 
#' Alonzo, T. A., Pepe, M. S., & Moskowitz, C. S. (2002). Sample size calculations for comparative studies of medical tests for detecting presence of disease. \emph{Statistics in medicine}, 21(6), 835-852.
#' 
#' @seealso \code{sesp.rel}.
#' @export
#' 
#' @examples
#' # Data from Cheng and Macaluso (Table 2)
#' breast.cancer.data <- read.tab.paired(
#'  10, 24, 21, NA,
#'  13, 144, 95, NA,
#'  testnames=c("Mammography", "Physical examination")
#' )
#' breast.cancer.data
#' tpffpf.rel.results <- tpffpf.rel(breast.cancer.data)
#' str(tpffpf.rel.results)
#' tpffpf.rel.results

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
