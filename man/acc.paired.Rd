\name{acc.paired}
\alias{acc.paired}
\title{Accuracy of Two Binary Diagnostic Tests in a Paired Study Design}
\description{
Sensitivity and specificity, (positive and negative) predictive values and (positive and negative) diagnostic likelihood ratios of a two binary diagnostic tests in a paired study design.}
\usage{
acc.paired(tab, alpha, ...)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.paired}}.
}
  \item{alpha}{Significance level alpha for 100(1-alpha)\%-confidence intervals, the default is 0.05.
}
\item{method.ci}{A function used to compute the confidence intervals for sensitivity, specificity, and predictive values. The default is \code{waldci} for Wald's asymptotic normal-based confidence intervals.  See \code{\link{acc.1test}}. 
  }
  \item{\dots}{Additional arguments, usually not required.
}
}
\details{
The calculation of accuracy measures and their variances follows standard methodology, e.g. described in Pepe (2003) or Zhou et al. (2011).
}

\value{A list of class \code{\link{acc.paired}}:
\item{Test1}{A list of class \code{\link{acc.1test}} containing results and accuracy estimates of Test 1.}
\item{Test2}{A list of class \code{\link{acc.1test}} containing results and accuracy estimates of Test 2.}
}

\references{
Pepe, M. (2003). The statistical evaluation of medical tests for classifcation and prediction. Oxford Statistical Science Series. Oxford University Press, 1st edition.

Zhou, X., Obuchowski, N., and McClish, D. (2011). Statistical Methods in Diagnostic Medicine. Wiley Series in Probability and Statistics. John Wiley & Sons, Hoboken, New Jersey, 2nd edition.

}

\seealso{
\code{\link{tab.paired}},
\code{\link{print.acc.paired}},
\code{\link{acc.1test}}.
}

\examples{
data(Paired1) # Hypothetical study data 
b1 <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
b2 <- acc.paired(b1)
print(b2)
}
