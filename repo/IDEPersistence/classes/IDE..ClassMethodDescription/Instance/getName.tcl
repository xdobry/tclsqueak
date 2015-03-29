IDE::ClassMethodDescription instproc getName {} {
    return [string range [namespace tail [self]] 1 end]
}
