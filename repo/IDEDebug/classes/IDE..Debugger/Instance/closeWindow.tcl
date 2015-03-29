IDE::Debugger instproc closeWindow {} {
    my instvar action
    if {![info exists action] || $action eq "break"} {
         # we have break action and the debugger is not closed
         # probably event loop has an error
         next
    } else {
         my set action break
    }
}
