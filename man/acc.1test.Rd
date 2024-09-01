\name{acc.1test}
\alias{acc.1test}
\title{Accuracy of a Single Binary Diagnostic Test}
\description{
Sensitivity and specificity, (positive and negative) predictive values and (positive and negative) diagnostic likelihood ratios of a single binary diagnostic test.}

\usage{
acc.1test(tab, alpha, testname, method.ci, ...)
}
\arguments{
  \item{tab}{An object of class \code{\link{tab.1test}}.
  }
  \item{alpha}{Significance level alpha for 100(1-alpha)\%-confidence intervals, the default is 0.05.
  }
  \item{testname}{A character string containing the name of the diagnostic test. 
  }
  \item{method.ci}{A function used to compute the confidence intervals for sensitivity, specificity, and predictive values. The default is \code{waldci} for Wald's asymptotic normal-based confidence intervals. See 'Details'. 
  }
  \item{\dots}{Additional arguments (usually not required).
  }
}
\details{
The calculation of accuracy measures follows standard methodology, e.g. described in Pepe (2003) or Zhou et al. (2011). 

The confidence intervals for sensitivity, specificity, and predictive values are computed using the methodology implemented in the function passed to the argument \code{method.ci}. 

Available options are: (1) \code{waldci} (Wald's asymptotic normal-based CI; the default), (2) \code{logitci} (asymptotic normal-based CI on the logit scale and then back transformed), (3) \code{proflikci} (profile likelihood CI), (4) \code{exactci} (Clopper-Pearson's exact CI); (5) \code{add4cici} (Agresti-Coull's add-4 CI), (6) \code{addz2ci} (Agresti-Coull's add-z^2/2 CI), (7) \code{blakerci} (Blaker's exact CI), (8) \code{scoreci} (Wilson's score CI), (9) \code{midPci} (mid-P CI). Options (3) to (9) are based on the homonymous functions from the  \code{{PropCIs}} package.

Alternatively, the user can specify a custom function that implements the desired method. Run \code{DTComPair:::logitci}  to see an example of how to write a custom function in terms of arguments and returned object.

Confidence intervals for diagnostic likelihood ratios are computed according to Simel et al. (1991).
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
a3 <- acc.1test(a1, method=exactci, conf.level=0.99)
print(a3)
}
