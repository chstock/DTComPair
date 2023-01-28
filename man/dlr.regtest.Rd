\name{dlr.regtest}
\alias{dlr.regtest}
\title{Differences in Diagnostic Likelihood Ratios}
\description{
Performs a test for differences in (positive and negative) diagnostic likelihood ratios (DLRs) of two binary diagnostic tests in a paired study using a regression model approach proposed by Gu and Pepe (2009).
}
\usage{
dlr.regtest(tab, alpha)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.paired}}.
  }
  \item{alpha}{Significance level alpha for 100(1-alpha)\%-confidence intervals, the default is 0.05.
  }
}

\details{
The null hypothesis rDLR = DLR of Test 1 / DLR of Test 2 = 1 is tested with respect to both positive and negative DLRs of the two diagnostic tests.

This function calls \code{\link{DLR}}, a general implementation of the method proposed by Gu and Pepe (2009).
}

\value{A list containing 
  \item{pdlr}{
    A list with 
    \code{test1} (the positive DLR of test 1),
    \code{test2} (the positive DLR of test 2), 
    \code{ratio} (the ratio of positive DLRs, computed as \code{test1/test2}, 
    \code{se.log} (the standard error of the logarithm of \code{ratio}),
    the \code{test.statistic} and the corresponding \code{p.value}.
    }
  \item{ndlr}{
      A list with 
    \code{test1} (the negative DLR of test 1),
    \code{test2} (the negative DLR of test 2), 
    \code{ratio} (the ratio of negative DLRs, computed as \code{test1/test2}, 
    \code{se.log} (the standard error of the logarithm of \code{ratio}),
    the \code{test.statistic} and the corresponding \code{p.value}.
    }
  \item{alpha}{The significance level alpha used to compute 100(1-alpha)\%-confidence intervals for the \code{ratio} of positive and negative DLRs, the default is 0.05.}
  \item{method}{The name of the method used to compare the positive and negative DLRs, here \dQuote{diagnostic likelihood regression model (regtest)}.}
}

\references{
Gu, W. and Pepe, M. S. (2009). Estimating the capacity for improvement in risk prediction with a marker. \emph{Biostatistics}, 10(1):172-86.

%Janssens, A. C. J. W., Deng, Y., Borsboom, G. J. J. M., Eijkemans, M. J. C., Habbema, J. D. F., and Steyerberg, E. W. (2005). A new logistic regression approach for the evaluation of diagnostic test results. \emph{Med Decis Making}, 25(2):168-77.
}

%\note{  ~~further notes~~ }

\seealso{
\code{\link{DLR}}
}

\examples{
data(Paired1) # Hypothetical study data
ptab <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
ptab
dlr.results <- dlr.regtest(ptab)
str(dlr.results)
dlr.results
}
