IDE::InstanceMethodDescription instproc getName {} {
    return [string range [namespace tail [self]] 2 end]
}
