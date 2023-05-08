## DTComPair version 1.2.1 (2023-05-08)

- Functions that compare sensitivity/ specificity and predictive values now return lists of vectors (instead of lists of lists).
- `Test 1` is consistently used as the reference test.
- In `pv.gs`and `pv.wgs`, it is now `diff.ppv <- ppv.2-ppv.1` (instead of `diff.ppv <- abs(ppv.1-ppv.2)`), and accordingly for negative predictive values.
- Added new function (`pv.prev`) to allow computation of positive and negative predictive values for different theoretical prevalances.

## DTComPair version 1.2.0 (2023-04-20)

- `pv.rpv()` now returns the full variance-covariance matrix (`Sigma`).
- `ellipse.pv.rpv()` generates the data to plot a joint confidence region for rPPV and rNPV (depends on the `ellipse` package) (as in Moskowitz and Pepe, 2006).
- `sesp.rel()` calculates relative sensitivity and relative specificity (with Wald CIs and p-value).
- `tpffpf.rel()` calculates relative sensitivity (rTPF) and relative 'one minus specificity' (rFPF) (with Wald CIs and p-value), but it does not calculate their individual components (ie, TPFs and FPFs); this function is meant to be used with paired screen-positive designs, where only rTPF and rFPF are estimable form the data (see Cheng and Macaluso, 1997 or Alonzo, Pepe, Moskowitz, 2002).
- The new features were contributed by A. Discacciati - many thanks!
    
    
## DTComPair version 1.1.0 (2023-02-21)

- Restored compatibility with CRAN requirements.

    
## DTComPair version 1.0.3 (2014-02-14)

- Corrected an error in `sesp.diff.ci` (detected by F. Gimenez - many thanks!).
- Minor documentation update.


## DTComPair version 1.0.2 (2013-11-12)

- Corrected an error in function `sesp.exactbinom` (detected by J. Swiecicki - many thanks!).
- Minor documentation update.