IDE::IntroProxy proc getDeepChildrenForClass class {
    set list [$class info subclass]
    foreach sclass $list {
        lappend list {*}[my getDeepChildrenForClass $sclass]
    }
    return $list
}
