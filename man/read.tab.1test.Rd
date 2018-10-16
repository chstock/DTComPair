\name{read.tab.1test}
\alias{read.tab.1test}
\title{Read in \dQuote{tab.1test}-Objects}
\description{Reads in objects of class \code{\link{tab.1test} using cell frequencies.}
}
\usage{
read.tab.1test(a, b, c, d, testname, ...)
}
\arguments{
  \item{a}{The number of diseased subjects with a positive test.}
  \item{b}{The number of non-diseased subjects with a positive test.}
  \item{c}{The number of diseased subjects with a negative test.}
  \item{d}{The number of non-diseased subjects with a negative test.}
  \item{testname}{An optional vector specifying the name of the diagnostic test, e.g. \code{c("Test A")}. If not supplied, the corresponding variable name is used as testname.
}
  \item{\dots}{Additional arguments (usually not required).
}
}

\value{Returns a list of class \code{\link{tab.1test}} containing:

\item{tab.1test}{A contingency table (matrix) of test results. 
 \tabular{lrrr}{
          \tab Diseased \tab Non-diseased \tab Total \cr
 Test pos. \tab \code{a} \tab \code{b}    \tab \code{a}+\code{b} \cr
 Test neg. \tab \code{c} \tab \code{d}    \tab \code{c}+\code{d} \cr
 Total     \tab \code{a}+\code{c} \tab \code{b}+\code{d}  \tab \code{a}+\code{b}+\code{c}+\code{d} 
 }
}
\item{testname}{The name of the diagnostic test.}
}

\note{ 
Objects of class \code{\link{tab.1test}} are required as arguments for \code{\link{acc.1test}}, a function to compute the accuracy of a binary diagnostic test.
}

\seealso{
\code{\link{tab.1test}},
\code{\link{print.tab.1test}}, 
\code{\link{acc.1test}}.
}

\examples{
read.t1 <- read.tab.1test(321, 51, 730, 272, testname="Test1")
class(read.t1)
read.t1
acc.1test(read.t1)
}
