\name{print.acc.paired}
\alias{print.acc.paired}
\title{Print \dQuote{acc.paired}-Object}
\description{Prints objects of class \code{\link{acc.paired}} in an easy-to-read form (S3method).
}
\usage{
\method{print}{acc.paired}(x, ...)
}
\arguments{
  \item{x}{An object of class \code{\link{acc.paired}}.
}
  \item{\dots}{Additional arguments (usually not required).
}
}
\value{Creates a list object from parts of its input that is then printed in a tabular layout.}
\seealso{
\code{\link{acc.paired}}.
}
\examples{
data(Paired1) # Hypothetical study data 
b1 <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
b2 <- acc.paired(b1)
print(b2)
}
