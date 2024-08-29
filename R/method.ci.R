waldci <- function(x, n, conf.level){
  stopifnot(n > 0, x <= n, conf.level > 0, conf.level < 1)
  alpha <- 1-conf.level
  if (isTRUE(x > 0 & x < n)) {
    stderr <- sqrt(x*(n-x)/n^3)
    lowlim <- max(0, x/n - qnorm(alpha/2, lower.tail = FALSE) * stderr)
    uplim <- min(x/n + qnorm(alpha/2, lower.tail = FALSE) * stderr, 1)  
  } else if (isTRUE(x == 0)) { # if x/n is 0 -> rule of three and no stderr
    stderr <- NA
    lowlim <- 0
    uplim <- -log(alpha)/n
  } else if (isTRUE(x == n)) { # if x/n is 1 -> rule of three and no stderr
    stderr <- NA
    lowlim <- 1 + log(alpha)/n
    uplim <- 1
  }
  cint <- c(lowlim, uplim)
  attr(cint, "conf.level") <- conf.level
  rval <- list(stderr = stderr, conf.int = cint)
  class(rval) <- "htest"
  return(rval)
}

logitci <- function(x, n, conf.level){
  stopifnot(n > 0, x <= n, conf.level > 0, conf.level < 1)
  alpha <- 1-conf.level
  if (isTRUE(x > 0 & x < n)) {
    glm.fit <- stats::glm(cbind(x, n-x) ~ 1, family = binomial(link = "logit"))
    stderr <- sqrt(stats::vcov(glm.fit))[1, 1]
    lowlim <- plogis(qlogis(x/n) - qnorm(alpha/2, lower.tail = FALSE) * stderr)
    uplim <-  plogis(qlogis(x/n) + qnorm(alpha/2, lower.tail = FALSE) * stderr)
  } else { # no stderr and ci if x/n is 0 or 1
    stderr <- uplim <- lowlim <- NA
  }
  cint <- c(lowlim, uplim)
  attr(cint, "conf.level") <- conf.level
  rval <- list(stderr = stderr, conf.int = cint)
  class(rval) <- "htest"
  return(rval)
}

proflikci <- function(x, n, conf.level){
  stopifnot(n > 0, x <= n, conf.level > 0, conf.level < 1)
  if (isTRUE(x > 0 & x < n)) {
    glm.fit <- stats::glm(cbind(x, n-x) ~ 1, family = binomial(link = "identity"))
    cint <- suppressMessages(unname(MASS:::confint.glm(glm.fit, level = conf.level)))
    stderr <- NA
  } else { # no stderr and ci if x/n is 0 or 1
    stderr <- uplim <- lowlim <- NA
    cint <- c(lowlim, uplim)
  }
  attr(cint, "conf.level") <- conf.level
  rval <- list(stderr = stderr, conf.int = cint)
  class(rval) <- "htest"
  return(rval)
}
