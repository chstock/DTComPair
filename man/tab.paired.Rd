\name{tab.paired}
\alias{tab.paired}
\title{Tabulate Results from Two Binary Diagnostic Tests in a Paired Study Design}
\description{
Produces contingency tables of results from two binary diagnostic tests evaluated in a paired study design. 
}
\usage{
tab.paired(d, y1, y2, data = NULL, testnames, ...)
}
\arguments{
  \item{d}{A numeric vector specifying the gold-standard results (1 = presence of disease, 0 = absence of disease).
}
  \item{y1}{A numeric vector specifying the results of diagnostic test 1 (1 = positive, 0 = negative).
}
  \item{y2}{A numeric vector specifying the results of diagnostic test 2 (1 = positive, 0 = negative).
}
  \item{data}{An optional data frame, list or environment containing the required variables \code{d}, \code{y1} and \code{y2}.
}
  \item{testnames}{An optional vector specifying the names of diagnostic test 1 and diagnostic test 2, e.g. \code{c("Test A","Test B")}. If not supplied, the variable names are used as testnames.
}
  \item{\dots}{Additional arguments (usually not required).
}
}

\value{Returns a list of class \code{\link{tab.paired}}:
\item{diseased}{A contingency table (matrix) of test results among \emph{diseased} subjects.
 \tabular{lrrr}{
          \tab Test1 pos. \tab Test1 neg. \tab Total \cr
 Test2 pos. \tab ...      \tab ...          \tab ... \cr
 Test2 neg. \tab ...      \tab ...          \tab ... \cr
 Total     \tab ...      \tab ...          \tab ... 
 }
} 
\item{non.diseased}{A contingency table (matrix) of test results among \emph{non-diseased} subjects.
 \tabular{lrrr}{
          \tab Test1 pos. \tab Test1 neg. \tab Total \cr
 Test2 pos. \tab ...      \tab ...          \tab ... \cr
 Test2 neg. \tab ...      \tab ...          \tab ... \cr
 Total     \tab ...      \tab ...          \tab ... 
 }
}
\item{testnames}{The names of the diagnostic tests.}
}

\note{
Objects of class \code{\link{tab.paired}} are essential arguments for various functions in the 
\code{\link{DTComPair}}-package.
}

\seealso{
\code{\link{print.tab.paired}}, 
\code{\link{read.tab.paired}}, 
\code{\link{tab.1test}}.
}
\examples{
data(Paired1) # Hypothetical study data 
b <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
str(b)
b$diseased
b$non.diseased
print(b)
}
