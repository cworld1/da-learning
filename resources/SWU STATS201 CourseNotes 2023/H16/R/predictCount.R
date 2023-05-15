predictCount=function (object, newdata, cilevel = 0.95, digit = 3, print.out = TRUE, 
    quasit=FALSE,...) 
{
    if (!inherits(object, "glm")) 
        stop("First input is not a \"glm\" object")
    if (!is.data.frame(newdata)) 
        stop("Argument \"newdata\" is not a data frame!")
    if(family(object)$link!="log" & family(object)$link!="logit")
        stop("Must be a poisson or binomial model")
    name.row <- paste("pred", 1:nrow(newdata), sep = ".")
    name.row <- 1:nrow(newdata)
    x <- attr(object$terms, "term.labels")
    y <- unlist(strsplit(x, "factor\\("))
    z <- unlist(strsplit(y, "\\)"))
    name.col <- z
    if (ncol(newdata) != length(name.col)) 
        stop("Incorrectly input the new data!")
    dimnames(newdata) <- list(name.row, name.col)
    pred <- predict.glm(object, newdata, se.fit = TRUE)
    Expected <- pred$fit
    percent <- 1 - (1 - cilevel)/2
    CIquantile=qnorm(percent)
    if(quasit&substr(family(object)$family,1,5)=="quasi") CIquantile=qt(percent,object$df.res)
    Conf.lower <- pred$fit - CIquantile * pred$se.fit
    Conf.upper <- pred$fit + CIquantile * pred$se.fit
    mat <- family(object)$linkinv(cbind(Expected, Conf.lower, Conf.upper))
    mat <- round(mat, digit)
    mat.df <- as.data.frame(mat)
    dimnames(mat.df)[[1]] <- dimnames(newdata)[[1]]
    dimnames(mat.df)[[2]] <- c("Expected", "Conf.lower", "Conf.upper")
    if (print.out) 
        print(mat.df)
    mat.df
    #invisible(list(frame = mat.df, fit = pred$fit, se.fit = pred$se.fit, 
    #    df = pred$df, cilevel = cilevel))
}

predictCount2=function (object, newdata, cilevel = 0.95, digit = 3, print.out = TRUE, 
    ...) 
{
    if (!inherits(object, "glm")) 
        stop("First input is not a \"glm\" object")
    if (!is.data.frame(newdata)) 
        stop("Argument \"newdata\" is not a data frame!")
    name.row <- paste("pred", 1:nrow(newdata), sep = ".")
    name.row <- 1:nrow(newdata)
    x <- attr(object$terms, "term.labels")
    y <- unlist(strsplit(x, "factor\\("))
    z <- unlist(strsplit(y, "\\)"))
    name.col <- z
    if (ncol(newdata) != length(name.col)) 
        stop("Incorrectly input the new data!")
    dimnames(newdata) <- list(name.row, name.col)
    pred <- predict.glm(object, newdata, se.fit = TRUE, ...)
    Predicted <- pred$fit
    percent <- 1 - (1 - cilevel)/2
    Conf.lower <- pred$fit - qnorm(percent) * pred$se.fit
    Conf.upper <- pred$fit + qnorm(percent) * pred$se.fit
    mat <- cbind(Predicted, Conf.lower, Conf.upper)
    mat <- round(mat, digit)
    mat.df <- as.data.frame(mat)
    dimnames(mat.df)[[1]] <- dimnames(newdata)[[1]]
    dimnames(mat.df)[[2]] <- c("Predicted", " Conf.lower", "Conf.upper")
    if (print.out) 
        print(mat.df)
    mat.df
    #invisible(list(frame = mat.df, fit = pred$fit, se.fit = pred$se.fit, 
    #    df = pred$df, cilevel = cilevel))
}

