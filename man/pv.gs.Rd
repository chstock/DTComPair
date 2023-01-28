\name{pv.gs}
\alias{pv.gs}
\title{Generalized Score Statistic for Comparison of Predictive Values}
\description{
Performs a test for differences in (positive and negative) predictive values of two binary diagnostic tests using a generalized score statistic proposed by Leisenring, Alonzo and Pepe (2000).
}
\usage{
pv.gs(tab)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.paired}}.
}
}

%\details{...}

\value{
A list containing:
\item{ppv}{A list with \code{test1} (the positive predictive value of test 1), \code{test2} (the positive predictive value of test 2), \code{diff} (the difference in positive predictive values, computed as \code{test2 - test1}), the \code{test.statistic} and the corresponding \code{p.value}. }
\item{npv}{A list with \code{test1} (the negative predictive value of test 1), \code{test2} (the negative predictive value of test 2), \code{diff} (the difference in negative predictive values, computed as \code{test2 - test1}), the \code{test.statistic} and the corresponding \code{p.value}. }
\item{method}{The name of the method used to compare predictive values, here \dQuote{generalized score statistic (gs)}. }
}

\references{
Leisenring, W., Alonzo, T., and Pepe, M. S. (2000). Comparisons of predictive values of binary medical diagnostic tests for paired designs. \emph{Biometrics}, 56(2):345-51.
}

\seealso{
\code{\link{pv.wgs}} and \code{\link{pv.rpv}}.
}

\examples{
data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
gs.results <- pv.gs(paired.layout)
str(gs.results)
gs.results
gs.results$ppv["p.value"]
}
