IDE::ListViewEvent instproc invokeAction {x y} {
    if {![my exists actionHandler] || [my actionHandler] eq ""} return
    my instvar sobject
    set actions [[my actionHandler] getActions [self] $sobject]
    if {$actions eq ""} return
    set m [my set win].listbox.popmenu
    ::destroy $m
    menu $m -tearoff 0
    foreach act $actions {
        set actname [lindex $act 0]
        set state [lindex $act 1]
        if {$state eq ""} {set state normal}
        $m add command -label $actname -command [list [self] invokeActionCommand $actname] -state $state
    }
   
    tk_popup $m $x $y
}
