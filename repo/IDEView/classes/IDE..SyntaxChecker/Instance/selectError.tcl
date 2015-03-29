IDE::SyntaxChecker instproc selectError item {
    set index [[self]::messages selectedIndex]
    set error [lindex [my set errors] $index]
    [self]::body removeColorize
    [self]::body colorizeRange [lindex $error 0] [expr {[lindex $error 1]+1}]
    [self]::body viewPos [lindex $error 0]

}
