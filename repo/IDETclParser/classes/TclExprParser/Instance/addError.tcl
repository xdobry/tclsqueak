TclExprParser instproc addError {message {token {}}} {
    my instvar isError elem valueStack
    set isError 1
    if {$token eq ""} {
        if {[llength $valueStack]>0} {
            set telem [lindex $valueStack end 0 0]
            if {![Object isobject $telem]} {
                set telem $elem
            }
        } else {
            set telem $elem
        }
    } else {
        set telem $token
    }
    $elem lappend perror [list $telem $message]
}
