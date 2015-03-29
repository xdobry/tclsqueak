PrsElement instproc prsString {} {
    [[my getParser] stream] copyFromTo [my begin] [my end]
}
