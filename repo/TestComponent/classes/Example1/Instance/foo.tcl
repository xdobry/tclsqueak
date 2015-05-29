Example1 instproc foo {} {
    # enter the body hier
    error myerror
    return foo
}
