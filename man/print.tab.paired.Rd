\name{print.tab.paired}
\alias{print.tab.paired}
\title{Print \dQuote{tab.paired}-Object}
\description{Prints objects of class \code{\link{tab.paired}} in an easy-to-read form (S3method).
}
\usage{
\method{print}{tab.paired}(x, ...)
}
\arguments{
  \item{x}{An object of class \code{\link{tab.paired}}.
}
  \item{\dots}{Additional arguments (usually not required).
}
}
\value{Creates a list object from parts of its input that is then printed in a tabular layout.}
\seealso{
\code{\link{tab.paired}},
\code{\link{acc.paired}},
\code{\link{tab.1test}}.
}
\examples{
data(Paired1) # Hypothetical study data 
b <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
print(b)
}