PrsMarkupVisitor instproc getElemContext elem {
    if {![Object isobject $elem]} {
        my set context
    } else {
        if {[Object isobject $elem] && [$elem exists context]} {
            return [$elem set context]
        } else {
            return [my getElemContext [$elem info parent]]
        }
    }
}
