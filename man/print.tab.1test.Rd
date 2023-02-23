\name{print.tab.1test}
\alias{print.tab.1test}
\title{Print \dQuote{tab.1test}-Object}
\description{Prints objects of class \code{\link{tab.1test}} in an easy-to-read form (S3method).
}
\usage{
\method{print}{tab.1test}(x, ...)
}
\arguments{
  \item{x}{An object of class \code{\link{tab.1test}}.
}
  \item{\dots}{Additional arguments (usually not required).
}
}
\value{Creates a list object from parts of its input that is then printed in a tabular layout.}
\seealso{
\code{\link{tab.1test}},
\code{\link{acc.1test}},
\code{\link{tab.paired}}.
}
\examples{
data(Paired1) # Hypothetical study data 
a <- tab.1test(d=d, y=y1, data=Paired1)
print(a)
}