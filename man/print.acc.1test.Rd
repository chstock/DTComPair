\name{print.acc.1test}
\alias{print.acc.1test}
\title{Print \dQuote{acc.1test}-Object}
\description{Prints objects of class \code{\link{acc.1test}} in an easy-to-read form.
}

\usage{
\method{print}{acc.1test}(x, ...)
}
\arguments{
  \item{x}{An object of class \code{\link{acc.1test}}.
}
  \item{\dots}{Additional arguments (usually not required).
}
}

\seealso{
\code{\link{acc.1test}}.
}
\examples{
data(Paired1) # Hypothetical study data 
a1 <- tab.1test(d=d, y=y1, data=Paired1)
a2 <- acc.1test(a1)
print(a2)
}
