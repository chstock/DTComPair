\name{sesp.exactbinom}
\alias{sesp.exactbinom}
\title{Exact Binomial Test for Differences in Sensitivity and Specificity
}
\description{Performs an exact binomial test for differences in sensitivity and specificity of two binary diagnostic tests in a paired study design.
}
\usage{
sesp.exactbinom(tab) %, alpha)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.paired}}.
}
 % \item{alpha}{Significance level alpha for 100(1-alpha)\%-confidence intervals, the default is 0.05.}
}
\details{
The function performs a standard exact binomial test.

An exact binomial test is recommended when the number of patients with differing results for test 1 and test 2 (discordant pairs) is small, i.e. <20 (Zhou et al., 2011). 
}

\value{
A list containing:
\item{sensitivity}{A list containing 
   \code{test1} (sensitivity of test 1), 
   \code{test2} (specificity of test 2), 
   \code{diff} (the difference in sensitivity, computed as \code{test2 - test1}) 
   and the corresponding \code{p.value}. }
\item{specificity}{A list containing 
   \code{test1} (specificity of test 1), 
   \code{test2} (specificity of test 2), 
   \code{diff} (the difference in specificity, computed as \code{test2 - test1})
   and the corresponding \code{p.value}. }
\item{method}{The name of the method used to compare sensitivity and specificity, here \dQuote{exactbinom}. }
}

\references{
Zhou, X., Obuchowski, N., and McClish, D. (2011). Statistical Methods in Diagnostic Medicine. Wiley Series in Probability and Statistics. John Wiley & Sons, Hoboken, New Jersey, 2nd edition.
}


\seealso{
\code{\link{sesp.mcnemar}} and \code{\link{tab.paired}}.
}

\examples{
data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
exact.results <- sesp.exactbinom(paired.layout)
str(exact.results)
exact.results
exact.results$sensitivity["p.value"]
}
