\name{DLR}
\alias{DLR}
\title{Estimating the Capacity for Improvement in Diagnostic Risk Prediction with an additional marker based on the Diagnostic Likelihood Ratio (DLR)}
\description{
This function allows for estimating the log diagnostic likelihood ratio in a regression model approach. 
It can be used to assess the gain in diagnostic accuracy for a new binary or continuous diagnostic marker compared
to established markers, to determine the impact of covariates on the risk prediction model, and to estimate the
DLR for selected marker/covariate values.
}
\usage{
DLR(basemodel, augmentedmodel, diseasestatus, dataset, clustervar = NULL, alpha=0.05)
}
\arguments{
  \item{basemodel}{pre-test/base model X, formula character string}
  \item{augmentedmodel}{post-test/ augmented model V, formula character string,
  this is usually the basemodel X including the additional diagnostic test of interest Y and interactions XY}
  \item{diseasestatus}{variable name containing disease status, assumed to be a 0/1 variable, for having condition of interest (1) or not (0), character string}
  \item{dataset}{dataframe, needs to be in wide format with one observation per subject}
  \item{clustervar}{optional, cluster variable name in dataset, character string}
  \item{alpha}{significance level alpha used for confidence intervals, the default is 0.05.}
}

\details{
This function is an implementation of the algorithm described in the appendix of Gu and Pepe (2009) using the GEE approach in order to get standard error estimates. The definition of I and Zero matrices is slightly more flexible than the ones described in section 3 in order to allow for models without interaction. 
}

\value{
Returns a list including
\item{logPreTestModel}{logistic regression model output for prior disease using base model X: P(D=1|X). All estimates are on a log scale.}
\item{logPostTestModel}{logistic regression model output for posterior disease using augmented model V: P(D=1|X,Y),i.e. P(D=1|V). All estimates are on a log scale.}
\item{logDLRModel}{regression model output for log DLR defined as difference between logPostTestModel and logPreTestModel. All estimates are on a log scale.}
\item{DLR}{Positive/negative DLR for diagnostic marker Y, with all base covariates X set to 1. Results are only sensible for binary marker Y taking values 0/1.}
}
\references{
Gu, W. and Pepe, M. S. (2009). Estimating the capacity for improvement in risk prediction with a marker. \emph{Biostatistics}, 10(1):172-86.

%Janssens, A. C. J. W., Deng, Y., Borsboom, G. J. J. M., Eijkemans, M. J. C., Habbema, J. D. F., and Steyerberg, E. W. (2005). A new logistic regression approach for the evaluation of diagnostic test results. \emph{Med Decis Making}, 25(2):168-77.
}
\author{
Thomas Hielscher (t.hielscher@dkfz.de) 
}

\seealso{
\code{\link{dlr.regtest}}
}

%\keyword{diagnostic likelihood ratio} 

\examples{
library(DTComPair)
data(Paired1)

# test y1 conditioned on null model: DLR+(Y1=1) and DLR-(Y1=0)

DLR("~ 1","~ y1","d",Paired1)

# test y1 conditioned on test y2 with interaction, DLR+(Y1=1|Y2=1) and DLR-(Y1=0|Y2=1)

DLR("~ y2","~ y2 * y1","d",Paired1) 
}

