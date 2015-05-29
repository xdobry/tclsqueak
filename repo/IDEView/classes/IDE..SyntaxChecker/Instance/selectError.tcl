IDE::SyntaxChecker instproc selectError item {
    set index [[self]::messages selectedIndex]
    set error [lindex [my set errors] $index]
    #[self]::methodedit removeColorize
    #[self]::methodedit colorizeRange [lindex $error 0] [expr {[lindex $error 1]+1}]
    [self]::methodedit viewPos [lindex $error 0]

}
