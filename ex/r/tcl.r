med.unif = function(a, b) {
    mean(runif(10, a,  b))
}

tcl = function(a, b, n) {
    means = c()
    for (i in 1:n) {
        means[i] = med.unif(a, b)

    }
    hist(means)
}

