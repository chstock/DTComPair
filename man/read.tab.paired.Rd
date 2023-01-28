\name{read.tab.paired}
\alias{read.tab.paired}
\title{Read in \dQuote{tab.paired}-Objects}
\description{Reads in objects of class \code{\link{tab.paired} using cell frequencies.}
}
\usage{
read.tab.paired(d.a, d.b, d.c, d.d, nd.a, nd.b, nd.c, nd.d, testnames, ...)
}
\arguments{
  \item{d.a}{The number of diseased subjects with a positive test 1 and a positive test 2.
}
  \item{d.b}{The number of diseased subjects with a negative test 1 and a positive test 2.
}
  \item{d.c}{The number of diseased subjects with a positive test 1 and a negative test 2.
}
  \item{d.d}{The number of diseased subjects with a negative test 1 and a negative test 2.
}
  \item{nd.a}{The number of non-diseased subjects with a positive test 1 and a positive test 2.
}
  \item{nd.b}{The number of non-diseased subjects with a negative test 1 and a positive test 2.
}
  \item{nd.c}{The number of non-diseased subjects with a positive test 1 and a negative test 2.
}
  \item{nd.d}{The number of non-diseased subjects with a negative test 1 and a negative test 2.
}
  \item{testnames}{An optional vector specifying the names of diagnostic test 1 and diagnostic test 2, e.g. \code{c("Test A","Test B")}. If not supplied, the variable names are used as testnames.
}
  \item{\dots}{Additional arguments (usually not required).
}
}

\value{Returns a list of class \code{\link{tab.paired}} containing:
\item{diseased}{A contingency table (matrix) of test results among \emph{diseased} subjects.
 \tabular{lrrr}{
          \tab Test1 pos. \tab Test1 neg. \tab Total \cr
 Test 2 pos. \tab \code{d.a} \tab \code{d.b}    \tab \code{d.a}+\code{d.b} \cr
 Test 2 neg. \tab \code{d.c} \tab \code{d.d}    \tab \code{d.c}+\code{d.d} \cr
 Total     \tab \code{d.a}+\code{d.c} \tab \code{d.b}+\code{d.d}  \tab \code{d.a}+\code{d.b}+\code{d.c}+\code{d.d}
} 
}
\item{non.diseased}{A contingency table (matrix) of test results among \emph{non-diseased} subjects.
 \tabular{lrrr}{
          \tab Test1 pos. \tab Test1 neg. \tab Total \cr
 Test 2 pos. \tab \code{nd.a} \tab \code{nd.b}    \tab \code{nd.a}+\code{nd.b} \cr
 Test 2 neg. \tab \code{nd.c} \tab \code{nd.d}    \tab \code{nd.c}+\code{nd.d} \cr
 Total     \tab \code{nd.a}+\code{nd.c} \tab \code{nd.b}+\code{nd.d}  \tab \code{nd.a}+\code{nd.b}+\code{nd.c}+\code{nd.d}
}
}
\item{testnames}{The names of the diagnostic tests.}
}

\note{ 
Objects of class \code{\link{tab.paired}} are essential arguments for various functions in the 
\code{\link{DTComPair}}-package.
}

\seealso{
\code{\link{tab.paired}},
\code{\link{print.tab.paired}}, 
\code{\link{acc.paired}},
\code{\link{generate.paired}}.
}
\examples{
read.t2 <- read.tab.paired(321, 51, 730, 272, 
                           120, 8, 74, 109,
                           testnames=c("Test A", "Test B"))
class(read.t2)
read.t2
acc.paired(read.t2)
}
