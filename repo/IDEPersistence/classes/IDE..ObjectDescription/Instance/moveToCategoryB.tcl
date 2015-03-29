IDE::ObjectDescription instproc moveToCategoryB {method category args} {
    next 
    if {[self callingproc] eq "setCategory"} {
        return
    }
    set mo [[self]::description getClassMethodIfExist $method]
    if {$mo ne ""} {
        $mo updateAttributes category
    }
}
