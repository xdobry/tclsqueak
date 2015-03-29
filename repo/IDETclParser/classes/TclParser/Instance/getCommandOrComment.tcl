TclParser instproc getCommandOrComment parent {
    if {[my getChar] eq "#"} {
        return [my getComment $parent]
    } else {
        return [my getCommand $parent]
    }
}
