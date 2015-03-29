IDE::MethodDescription instproc getName {} {
    return [namespace tail [self]]
}
