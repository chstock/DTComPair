\name{represent.long}
\alias{represent.long}
\title{Long Representation of Results from Two Binary Diagnostic Tests}
\description{Long representation of results from two binary diagnostic tests.}
\usage{
represent.long(d, y1, y2)
}
\arguments{
  \item{d}{A numeric vector specifying the gold-standard results (1 = presence of disease, 0 = absence of disease).
}
  \item{y1}{A numeric vector specifying the results of diagnostic test 1 (1 = positive, 0 = negative).
}
  \item{y2}{An numeric vector specifying the results of diagnostic test 2 (1 = positive, 0 = negative).
}
}

\details{Sometimes a long representation of data from a \dQuote{paired} study of binary diagnostic tests is required, e.g. to run regression analyses.

In a \emph{wide} representation each subject has 1 record in the dataset containing \code{d}, \code{y1} and \code{y2}.

In a \emph{long} representation each subjects has 2 records in the dataset, one for each test. The data format is shown below.
}

\value{
A dataframe containing:
  \item{id}{A numeric vector specifying the patient identifier.}
  \item{d}{A numeric vector specifying the gold-standard results (1 = presence of disease, 0 = absence of disease).
}
  \item{x}{A numeric vector specifying the diagnostic test (1 = test 1, 0 = test 2).
}
  \item{y}{A numeric vector specifying the test results (1 = positive, 0 = negative).
}
}

\seealso{
\code{\link{tab.paired}} and \code{\link{read.tab.paired}}.
}

\examples{
data(Paired1) # Hypothetical study data
names(Paired1)
new.long <- represent.long(d=Paired1$d, y1=Paired1$y1, y2=Paired1$y2)
str(new.long)
head(new.long)
}
