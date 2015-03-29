IDE::FocusPerKey instproc init args {
    next
    my instvar win focusKey nextFocus prevFocus
    if {[info exists focusKey]} {
        bind [winfo toplevel $win] <$focusKey> [list [self] getFocus]
    }
    if {[info exists nextFocus]} {
        bind [my getFocusWin] <Tab> "focus $nextFocus; break"
    }
    if {[info exists prevFocus]} {
        bind [my getFocusWin] <<PrevWindow>> "focus $prevFocus; break"
    }
}
