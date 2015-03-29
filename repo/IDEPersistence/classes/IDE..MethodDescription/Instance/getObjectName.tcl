IDE::MethodDescription instproc getObjectName {} {
    return [[my info parent] getObjectName] 
}
