\name{Paired1}
\docType{data}
\alias{Paired1}
\title{DTComPair-dataset 1}
\description{
Hypothetical data from a paired study that aims to compare the accuracy of two binary diagnostic tests.
}
\usage{Paired1}
\format{A dataframe containing 3 columns (\code{d}, \code{y1} and \code{y2}) and 712 rows.

\code{d} is a numeric vector specifying the gold-standard results (1 = presence of disease, 0 = absence of disease).

\code{y1} is a numeric vector specifying the results of diagnostic test 1 (1 = positive, 0 = negative).

\code{y2} is a numeric vector specifying the results of diagnostic test 1 (1 = positive, 0 = negative).
}
\examples{
data(Paired1) # Hypothetical study data 
ftable(Paired1)
}
\keyword{datasets}