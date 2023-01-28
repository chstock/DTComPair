\name{tab.1test}
\alias{tab.1test}
\title{Tabulate Single Binary Diagnostic Test vs. Gold-Standard}
\description{Produces a contingency table of results from a single binary diagnostic test vs. the gold-standard results.
}
\usage{
tab.1test(d, y, data = NULL, testname, ...)
}
\arguments{
  \item{d}{A numeric vector specifying the gold-standard results (1 = presence of disease, 0 = absence of disease).
}
  \item{y}{A numeric vector specifying the results of the diagnostic test (1 = positive, 0 = negative).
}
  \item{data}{An optional data frame, list or environment containing the required variables \code{d} and \code{y}.
}
  \item{testname}{An optional character variable specifying the name of the diagnostic test, e.g. \code{c("Test A")}. If not supplied, the variable name is used as the testname.
}
  \item{\dots}{Additional arguments (usually not required).
}
}
\value{Returns a list of class \code{\link{tab.1test}}:
\item{tab.1test}{A contingency table (matrix) of test results. 
 \tabular{lrrr}{
          \tab Diseased \tab Non-diseased \tab Total \cr
 Test pos. \tab ...      \tab ...          \tab ... \cr
 Test neg. \tab ...      \tab ...          \tab ... \cr
 Total     \tab ...      \tab ...          \tab ... 
 }
}
\item{testname}{The name of the diagnostic test.}
}

\note{ 
Objects of class \code{\link{tab.1test}} are required as arguments for \code{\link{acc.1test}}, a function to compute the accuracy of a binary diagnostic test.
}

\seealso{
\code{\link{tab.paired}},
\code{\link{acc.1test}},
\code{\link{acc.paired}}.
}

\examples{
data(Paired1) # Hypothetical study data 
a <- tab.1test(d=d, y=y1, data=Paired1)
str(a)
a$tab.1test
a
}