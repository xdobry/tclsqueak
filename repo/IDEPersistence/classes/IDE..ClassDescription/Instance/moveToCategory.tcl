IDE::ClassDescription instproc moveToCategory {method category} {
    next 
    if {[self callingproc] eq "setCategory"} {
        return
    }
    set mo [[my getDescription] getInstanceMethodIfExist $method]
    if {$mo ne ""} {
        $mo updateAttributes category
    }
}
