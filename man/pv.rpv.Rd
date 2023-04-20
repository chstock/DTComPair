\name{pv.rpv}
\alias{pv.rpv}
\title{Comparison of Predictive Values using Relative Predictive Values}
\description{Performs a test for differences in (positive and negative) predictive values of two binary diagnostic tests in a paired study design using relative predictive values, as proposed by Moskowitz and Pepe (2006).
}
\usage{
pv.rpv(tab, alpha)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.paired}}.}
  \item{alpha}{Significance level alpha used to compute 100(1-alpha)\%-confidence intervals, the default is 0.05.}
}

\value{
A list containing:
\item{ppv}{List with \code{test1} (the positive predictive value of test 1), \code{test2} (the positive predictive value of test 2), \code{rppv} (the relative positive predictive value, computed as \code{test1 / test2}), \code{se.log.rppv} (the standard error of the logarithm of \code{rppv}),
\code{lcl.rppv} (lower confidence limit of \code{rppv}), \code{ucl.rppv} (the upper confidence limit of \code{rppv}), the \code{test.statistic} and the corresponding \code{p.value}. }
\item{npv}{List with \code{test1} (the negative predictive value of test 1), \code{test2} (the negative predictive value of test 2), \code{rnpv} (the relative negative predictive value, computed as \code{test1 / test2}), \code{se.log.rnpv} (the standard error of the logarithm of \code{rnpv}),
\code{lcl.rnpv} (the lower confidence limit of \code{rnpv}), \code{ucl.rnpv} (the upper confidence limit of \code{rnpv}), the \code{test.statistic} and the corresponding \code{p.value}. }
\item{Sigma}{Estimated variance-covariance matrix for \{log(relative positive predictive value), log(relative negative predictive value)\}.}
\item{method}{Name of the method used to compare predictive values, here \dQuote{relative predictive values (rpv)}. }
\item{alpha}{Significance level alpha used to compute 100(1-alpha)\%-confidence intervals for \code{rppv} and \code{rnpv}, the default is 0.05.} 
}

\references{
Moskowitz, C.S., and Pepe, M.S. (2006). Comparing the predictive values of diagnostic tests: sample size and analysis for paired study designs. \emph{Clin Trials}, 3(3):272-9.
}

%\note{ ~~further notes~~ }

\seealso{
\code{\link{pv.gs}} and \code{\link{pv.wgs}}.
}

\examples{
data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
rpv.results <- pv.rpv(paired.layout)
str(rpv.results)
rpv.results
rpv.results$ppv["p.value"]
}
