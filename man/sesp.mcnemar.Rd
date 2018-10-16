\name{sesp.mcnemar}
\alias{sesp.mcnemar}
\title{McNemar Test for Comparison of Sensitivities and Specificities}
\description{Performs a McNemar Test for comparison of sensitivities and specificities of two binary diagnostic tests in a paired study design.
}
\usage{
sesp.mcnemar(tab)
}

\arguments{
  \item{tab}{An object of class \code{\link{tab.paired}}.
}
}

\details{ 
The test is performed as described by McNemar (1947).
}

\value{
A list containing:
\item{sensitivity}{A list containing 
   \code{test1} (sensitivity of test 1), 
   \code{test2} (specificity of test 2), 
   \code{diff} (the difference in sensitivity, computed as \code{test2 - test1}), 
   the \code{test.statistic} and the corresponding \code{p.value}. 
   }
\item{specificity}{A list containing 
   \code{test1} (specificity of test 1), 
   \code{test2} (specificity of test 2), 
   \code{diff} (the difference in specificity, computed as \code{test2 - test1}), 
   the \code{test.statistic} and the corresponding \code{p.value}. 
   }
\item{method}{The name of the method used to compare sensitivity and specificity, here \dQuote{\code{mcnemar}}.
 }
}

\references{
McNemar, Q. (1947). Note on the sampling error of the difference between correlated proportions or percentages. \emph{Psychometrika}, 12(2):153-7.
}

\seealso{
\code{\link{sesp.exactbinom}} and \code{\link{tab.paired}}.
}

\examples{
data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
mcnem.results <- sesp.mcnemar(paired.layout)
str(mcnem.results)
mcnem.results
mcnem.results$sensitivity["p.value"]
}
