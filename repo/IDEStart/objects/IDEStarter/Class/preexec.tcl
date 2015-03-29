IDEStarter proc preexec {} {
    if { [my exists preexec] } {
        namespace eval :: [my set preexec]
    }
}
