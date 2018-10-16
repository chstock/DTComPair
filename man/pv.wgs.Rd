\name{pv.wgs}
\alias{pv.wgs}
\title{Weighted Generalized Score Statistic for Comparison of Predictive Values}
\description{Performs a test for differences in (positive and negative) predictive values of two binary diagnostic tests using a weighted generalized score statistic proposed by Kosinski (2013).
}
\usage{
pv.wgs(tab)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.paired}}.
}
}

%\details{...}

\value{
A list containing:
\item{ppv}{A list with \code{test1} (the positive predictive value of test 1), \code{test2} (the positive predictive value of test 2), \code{diff} (the difference in positive predictive values, computed as \code{test2 - test1}, the \code{test.statistic} and the corresponding \code{p.value}. }
\item{npv}{A list with \code{test1} (the negative predictive value of test 1), \code{test2} (the negative predictive value of test 2), \code{diff} (the difference in negative predictive values, computed as \code{test2 - test1}, the \code{test.statistic} and the corresponding \code{p.value}. }
\item{method}{The name of the method used to compare predictive values, here \dQuote{weighted generalized score statistic (wgs)}. }
}

\references{
Kosinski, A.S. (2013). A weighted generalized score statistic for comparison of predictive values of diagnostic tests. \emph{Stat Med}, 32(6):964-77.
}


\seealso{
\code{\link{pv.gs}} and \code{\link{pv.rpv}}.
}

\examples{
data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
paired.layout 
wgs.results <- pv.wgs(paired.layout)
str(wgs.results)
wgs.results
wgs.results$ppv["p.value"]
}
