#' Generalized McNemar's test
#'
#' Performs a generalized McNemar's test to jointly compare sensitivity and specificity.
#'
#' @param tab An object of class `tab.paired`.
#'
#' @return A vector containing the test statistic and the p-value.
#' 
#' @export
#' 
#' @references Lachenbruch P.A., Lynch C.J. (1998). Assessing screening tests: extensions of McNemar's test. \emph{Stat Med}, 17(19): 2207-17.
#' 
#' @seealso [tab.paired()], [read.tab.paired()] and [sesp.mcnemar()]
#'
#' @examples
#' # Example 1:
#' data(Paired1) # Hypothetical study data
#' ftable(Paired1)
#' paired.layout1 <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
#' print(paired.layout1)
#' sesp.gen.mcnemar(paired.layout1)
#' 
#' # Example 2 (from Lachenbruch and Lynch (1998)):
#' paired.layout2 <- read.tab.paired(
#'   d.a  = 850, d.b  = 40, d.c  = 60, d.d  =  50, 
#'   nd.a =  60, nd.b = 25, nd.c = 15, nd.d = 900, 
#'   testnames = c("T1", "T2")
#' )
#' print(paired.layout2)
#' sesp.gen.mcnemar(paired.layout2)
#' 
sesp.gen.mcnemar <- function(tab) {
  mcnemar <- sesp.mcnemar(tab)
  X2 <- mcnemar$sensitivity["test.statistic"] + mcnemar$specificity["test.statistic"]
  p.value <- 1 - pchisq(X2, df = 2)
  results <- c(X2, p.value)
  names(results) <- c("test.statistic", "p.value")
  return(results)
}