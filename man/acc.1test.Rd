\name{acc.1test}
\alias{acc.1test}
\title{Accuracy of a Single Binary Diagnostic Test}
\description{
  Sensitivity and specificity, (positive and negative) predictive values and 
  (positive and negative) diagnostic likelihood ratios of a single binary 
  diagnostic test.
}
\usage{
acc.1test(tab, alpha, testname, method.ci, ...)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.1test}}.
  }
  \item{alpha}{Significance level alpha for 100(1-alpha)\%-confidence intervals, 
  the default is 0.05.
  }
  \item{testname}{A character string containing the name of the diagnostic test. 
  }
  \item{method.ci}{A character string with the name of the function to compute 
  the confidence intervals for sensitivity, specificity, and predictive values. 
  The default is \code{''waldci''} for a Wald asymptotic normal-based confidence 
  intervals. See 'Details'. 
  }
  \item{\dots}{Additional arguments (usually not required).
  }
}
\details{
The calculation of accuracy measures follows standard methodology, e.g. 
described in Pepe (2003) or Zhou et al. (2011). 

The confidence intervals for sensitivity, specificity, and predictive values are 
computed using the methodology implemented in the function passed to the 
argument \code{method.ci}. 

Available options are: 

\enumerate{
  \item \code{waldci} - Wald asymptotic normal-based confidence interval; the 
  default, 
  \item \code{logitci} - asymptotic normal-based confidence interval on the 
  logit scale and then back-transformed, 
  \item \code{exactci} - Clopper-Pearson exact confidence interval, 
  \item \code{add4cici} - Agresti-Coull add-4 confidence interval, 
  \item \code{addz2ci} - Agresti-Coull add-z^2/2 confidence interval, 
  \item \code{blakerci} - Blaker exact confidence interval, 
  \item \code{scoreci} - Wilson score confidence interval, 
  \item \code{midPci} - mid-P confidence interval. 
}

Options (3) to (8) are based on the homonymous functions from the \code{{PropCIs}} 
package. Please see the respective package documentation for more details.

Confidence intervals for diagnostic likelihood ratios are computed according to 
Simel et al. (1991).

}
\value{A list of class \code{\link{acc.1test}}:
\item{tab}{A contingency table (matrix) of test results; the same \code{tab} that is supplied as an argument. 
 \tabular{lrrr}{
          \tab Diseased \tab Non-diseased \tab Total \cr
 Test pos. \tab ...      \tab ...          \tab ... \cr
 Test neg. \tab ...      \tab ...          \tab ... \cr
 Total     \tab ...      \tab ...          \tab ... 
 }
} 
\item{sensitivity }{A numeric vector containing the estimated sensitivity (\code{est}), its standard error (\code{se}), lower confidence limit (\code{lcl}) and upper confidence limit (\code{ucl}).}
\item{specificity }{A numeric vector containing the estimated specificity (\code{est}), its standard error (\code{se}), lower confidence limit (\code{lcl}) and upper confidence limit (\code{ucl}).}
\item{ppv }{A numeric vector containing the estimated positive predictive value (\code{est}), its standard error (\code{se}), lower confidence limit (\code{lcl}) and upper confidence limit (\code{ucl}).}
\item{npv }{A numeric vector containing the estimated negative predictive value (\code{est}), its standard error (\code{se}), lower confidence limit (\code{lcl}) and upper confidence limit (\code{ucl}).}
\item{pdlr }{A numeric vector containing the estimated positive diagnostic likelihood ratio (\code{est}), the standard error of the logarithm of the positive diagnostic likelihood ratio (\code{se.ln}), the lower confidence limit (\code{lcl}) and the upper confidence limit (\code{ucl}).}
\item{ndlr }{A numeric vector containing the estimated negative diagnostic likelihood ratio (\code{est}), the standard error of the logarithm of the negative diagnostic likelihood ratio (\code{se.ln}), the lower confidence limit (\code{lcl}) and the upper confidence limit (\code{ucl}).}
\item{alpha }{The significance level alpha used to compute 100(1-alpha)\%-confidence intervals, the default is 0.05.}
\item{testname }{A character string containing the name of the diagnostic test. }
\item{method.ci }{A character string describing the method used to compute the confidence intervals for sensitivity, specificity, and predictive values.}

}

\references{
Pepe, M. (2003). The statistical evaluation of medical tests for classification and prediction. Oxford Statistical Science Series. Oxford University Press, 1st edition.

Simel, D.L., Samsa, G.P., Matchar, D.B. (1991). Likelihood ratios with confidence: sample size estimation for diagnostic test
studies. \emph{J Clin Epidemiol}, 44(8):763-70.

Zhou, X., Obuchowski, N., and McClish, D. (2011). Statistical Methods in Diagnostic Medicine. Wiley Series in Probability and Statistics. John Wiley & Sons, Hoboken, New Jersey, 2nd edition.

}

\seealso{
\code{\link{tab.1test}},
\code{\link{print.acc.1test}},
\code{\link{acc.paired}}.
}
\examples{
data(Paired1) # Hypothetical study data 
a1 <- tab.1test(d=d, y=y1, data=Paired1)
a2 <- acc.1test(a1)
print(a2)
a3 <- acc.1test(a1, method="exactci", alpha=0.01)
print(a3)
}
