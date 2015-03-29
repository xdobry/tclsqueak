IDE::SyntaxErrorView instproc selectError item {

    set index [[self]::errorlist selectedIndex]
    set error [lindex [my errors] $index]
    [my editor] colorizeRange [lindex $error 0] [expr {[lindex $error 1]+1}]
    [my editor] viewPos [lindex $error 0]
}
