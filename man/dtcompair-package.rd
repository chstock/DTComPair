\name{DTComPair-package}
\alias{DTComPair-package}
\alias{DTComPair}
\docType{package}
\title{Comparison of Binary Diagnostic Tests in a Paired Study Design}

\description{
Comparison of the accuracy of two binary diagnostic tests in a \dQuote{paired} study design, i.e. when each test is applied to each subject in the study. 
}

\details{
\tabular{ll}{
Package: \tab DTComPair\cr
Type: \tab Package\cr
Version: \tab 1.1.0\cr
Date: \tab 2023-02-21\cr
License: \tab GPL (>= 3)\cr
}

The accuracy measures that can be compared in the present version are sensitivity, specificity, positive and negative predictive values, and positive and negative diagnostic likelihood ratios.  

It is required that results from a binary gold-standard test are also available. 

Methods for comparison of sensitivity and specificity: McNemar test (McNemar, 1947) and exact binomial test. Further, several methods to compute confidence intervals for differences in sensitivity and specificity are implemented.

Methods for comparison of positive and negative predictive values: generalized score statistic (Leisenring, Alonzo and Pepe, 2000), weighted generalized score statistic (Kosinski, 2013) and comparison of relative predictive values (Moskowitz and Pepe, 2006).

Methods for comparison of positive and negative diagnostic likelihood ratios: a regression model approach (Gu and Pepe, 2009).

For a general introduction into the evaluation of diagnostic tests see e.g. Pepe (2003), Zhou, Obuchowski and McClish (2011).
}

\author{
Christian Stock, Thomas Hielscher

Maintainer: Christian Stock <christian.stock@boehringer-ingelheim.com>
}

\references{
Gu and Pepe (2009), "Estimating the capacity for improvement in risk prediction with a marker", <doi:10.1093/biostatistics/kxn025>. 

Kosinski (2013), "A weighted generalized score statistic for comparison of predictive values of diagnostic tests", <doi:10.1002/sim.5587>.

Leisenring, Alonzo and Pepe (2000), "Comparisons of predictive values of binary medical diagnostic tests for paired designs", <doi:10.1111/j.0006-341X.2000.00345.x>.

McNemar (1947), "Note on the sampling error of the difference between correlated proportions or percentages",  <doi:10.1007/BF02295996>.

Moskowitz and Pepe (2006), "Comparing the predictive values of diagnostic tests: sample size and analysis for paired study designs", <doi:10.1191/1740774506cn147oa>.

Pepe (2003, ISBN:978-0198509844), "The statistical evaluation of medical tests for classifcation and prediction".

Zhou, Obuchowski and McClish (2011). "Statistical Methods in Diagnostic Medicine", <doi:10.1002/9780470906514>.

}

\seealso{
Data management functions: \code{\link{tab.1test}}, \code{\link{tab.paired}}, \code{\link{read.tab.paired}}, \code{\link{generate.paired}} and \code{\link{represent.long}}.

Computation of standard accuracy measures for a single test: \code{\link{acc.1test}} and \code{\link{acc.paired}}.

Comparison of sensitivity and specificity: \code{\link{sesp.mcnemar}}, \code{\link{sesp.exactbinom}} and \code{\link{sesp.diff.ci}}.

Comparison of positive and negative predictive values: \code{\link{pv.gs}}, \code{\link{pv.wgs}} and \code{\link{pv.rpv}}.

Comparison of positive and negative diagnostic likelihood ratios: \code{\link{dlr.regtest}} and \code{\link{DLR}}.
}

\examples{
data(Paired1) # Hypothetical study data 
hsd <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
acc.paired(hsd)
sesp.mcnemar(hsd)
pv.rpv(hsd)
dlr.regtest(hsd)
}

\keyword{ package }