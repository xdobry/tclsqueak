IDE::TclOOIntroProxy instproc getDeepChildrenForClass class {
    set list [info class subclasses $class]
    foreach sclass $list {
        lappend list {*}[my getDeepChildrenForClass $sclass]
    }
    return $list
}
