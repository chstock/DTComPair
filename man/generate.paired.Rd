\name{generate.paired}
\alias{generate.paired}
\title{Generate Dataset from \dQuote{tab.paired}-Object}
\description{
Generates a dataset from contingency tables of binary diagnostic test results in a paired study design.
}
\usage{
generate.paired(tab, ...)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.paired}}.  
}
  \item{\dots}{Additional arguments (usually not required).
}
}

% \details{...}

\value{
A dataframe containing:

  \item{d}{A numeric vector specifying the gold-standard results (1 = presence of disease, 0 = absence of disease).
}
  \item{y1}{A numeric vector specifying the results of diagnostic test 1 (1 = positive, 0 = negative).
}
  \item{y2}{A numeric vector specifying the results of diagnostic test 2 (1 = positive, 0 = negative).
}
}

\seealso{
\code{\link{tab.paired}} and \code{\link{read.tab.paired}}. 
}

\examples{
data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
new.df <- generate.paired(paired.layout)
head(new.df)
ftable(new.df)
}
