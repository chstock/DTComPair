#' Compute predictive values for theoretical prevalences
#' 
#' @description It is often of interest to estimate predcitive values assuming the test were applied to a population with a different prevalance of the disease. Projected predictive values may be calculated using Bayes theorem and the relation between predictive values and diganostic likelihood ratios can be used to derived corresponding confidence intervals.
#' 
#' @param pi A theoretical prevalance of the disease (proportion).
#' @param acc An object of class `acc.1test`.
#'
#' @return A vector containing the projected values.
#' @export
#' 
#' @details Predictive values, assuming a certain prevalance of the disease, 
#' are derived using the relation between predictive values and diagnostic likelihood ratios:
#' 
#'   - PPV = 1 / {1 + (1 / pi - 1) / pDLR}
#'   - NPV = 1 / {1 + (1 / (1 / pi - 1)) / nDLR}. 
#'   
#' See Newcombe RG (2013). Confidence Intervals for Proportions and Related Measures of Effect Size. Chapman and Hall/ CRC Biostatistics Series (chapters 12.3+5 and 14.9).
#' 
#' The alpha-level of (1-alpha)-confidence intervals is inherited from `acc.1test`.
#'
#' @seealso [acc.1test()]
#'
#' @examples
#' data(Paired1) # Hypothetical study data 
#' a1 <- tab.1test(d=d, y=y1, data=Paired1)
#' a2 <- acc.1test(a1, alpha = 0.05)
#' pv.prev(pi=0.2, acc=a2)
#' pv.prev(pi=0.5, acc=a2)
#' 
pv.prev <- function(pi, acc){
  # general
  pdlr_est <- acc$pdlr["est"]; ndlr_est <- acc$ndlr["est"]
  pdlr_lcl <- acc$pdlr["lcl"]; ndlr_lcl <- acc$ndlr["lcl"]
  pdlr_ucl <- acc$pdlr["ucl"]; ndlr_ucl <- acc$ndlr["ucl"]
  # projected predicted values
  proj_pv <- vector(length = 7)
  names(proj_pv) <- c(
    "pi",
    "ppv_est", "ppv_lcl", "ppv_ucl",
    "npv_est", "npv_lcl", "npv_ucl"
    )
  proj_pv["pi"] <- pi
  proj_pv["ppv_est"] <- 1 / (1 + (1/pi - 1) / pdlr_est)
  proj_pv["ppv_lcl"] <- 1 / (1 + (1/pi - 1) / pdlr_lcl)
  proj_pv["ppv_ucl"] <- 1 / (1 + (1/pi - 1) / pdlr_ucl)
  proj_pv["npv_est"] <- 1 / (1 + (1 /(1/pi - 1)) / ndlr_est)
  proj_pv["npv_lcl"] <- 1 / (1 + (1 /(1/pi - 1)) / ndlr_lcl)
  proj_pv["npv_ucl"] <- 1 / (1 + (1 /(1/pi - 1)) / ndlr_ucl)
  # return
  return(proj_pv)
}