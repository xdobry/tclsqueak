IDE::XOIntroProxy instproc getAllInstMethodsForClass {class {ignoreList {}}} {
    set methods [$class info instprocs]
    foreach class [$class info heritage] {
        if {$class in $ignoreList} continue
	lappend methods {*}[$class info instprocs]]
    }
    lsort -unique $methods
}
