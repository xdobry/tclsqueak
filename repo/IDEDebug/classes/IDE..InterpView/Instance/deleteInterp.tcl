IDE::InterpView instproc deleteInterp interp {
    if {[IDE::Dialog yesNo "Do you really want to delete interpreter: $interp"] eq "yes"} {
        interp delete $interp
        my refresh
    }
}
