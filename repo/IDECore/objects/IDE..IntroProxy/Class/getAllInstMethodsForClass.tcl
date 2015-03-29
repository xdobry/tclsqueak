IDE::IntroProxy proc getAllInstMethodsForClass {class {ignoreList {}}} {
    set methods [$class info instprocs]
    foreach class [$class info heritage] {
        if {$class in $ignoreList} continue
	set methods [concat $methods [$class info instprocs]]
    }
    return [lsort -unique $methods]
}
