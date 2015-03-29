IDE::TclModeEdit instproc initBindings {} {
    next
    set twin [my getTextWindow]
    bind $twin <<Modified>> [list [self] modifyEvent]
    #bind $twin <KeyPress-F3> "[self] showRef \[$twin tag names current\]"
}
