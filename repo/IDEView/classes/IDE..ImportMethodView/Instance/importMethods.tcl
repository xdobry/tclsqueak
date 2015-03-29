IDE::ImportMethodView instproc importMethods {} {
    foreach method [[self]::methodlist selectedItem] {
        [my component] importTclProc $method
    }
    my useFilter
}
