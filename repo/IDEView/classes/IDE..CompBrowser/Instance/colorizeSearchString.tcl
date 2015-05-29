IDE::CompBrowser instproc colorizeSearchString {} {
    my instvar regexpr_string
    if {[info exists regexpr_string] && $regexpr_string ne ""} {
        [self]::methodedit dispatchTab colorizeRegExprTextAll $regexpr_string
    }
}
