waldci <- function(x, n, conf.level){
  if (x > 0 & x < n) {
    se <- sqrt(x*(n-x)/n^3)
    lowlim <- max(0, x/n - qnorm((1-conf.level)/2, lower.tail = FALSE) * se)
    uplim <-  min(x/n + qnorm((1-conf.level)/2, lower.tail = FALSE) * se, 1)  
  } else if (x == 0) { # if x/n is 0 -> rule of three and no se
    se <- NA
    lowlim <- 0
    uplim <- -log(1-conf.level)/n
  } else if (x == n) { # if x/n is 1 -> rule of three and no se
    se <- NA
    lowlim <- 1 + log(1-conf.level)/n
    uplim <- 1
  }
  cint <- c(lowlim, uplim)
  return(
    list(se = se,
         conf.int = cint)
  )
}

logitci <- function(x, n, conf.level){
  if (x > 0 & x < n) {
  glm.fit <- stats::glm(cbind(x, n-x) ~ 1, family = binomial(link = "logit"))
  se <- sqrt(stats::vcov(glm.fit))[1, 1]
  lowlim <- plogis(qlogis(x/n) - qnorm((1-conf.level)/2, lower.tail = FALSE) * se)
  uplim <-  plogis(qlogis(x/n) + qnorm((1-conf.level)/2, lower.tail = FALSE) * se)
  } else { # no se/ci if x/n is 0 or 1
    se <- NA
    lowlim <- NA
    uplim <- NA
  }
  cint <- c(lowlim, uplim)
  return(
    list(se = se,
         conf.int = cint)
  )
}

proflikci <- function(x, n, conf.level){
  if (x > 0 & x < n) {
    glm.fit <- stats::glm(cbind(x, n-x) ~ 1, family = binomial(link = "identity"))
    cint <- suppressMessages(MASS:::confint.glm(glm.fit, level = conf.level))
  } else { # no se/ci if x/n is 0 or 1
    lowlim <- NA
    uplim <- NA
    cint <- c(lowlim, uplim)
  }
  return(
    list(conf.int = cint)
  )
}
