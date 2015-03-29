IDE::VarsTracker instproc hasAnyWatch {} {
    expr {[my exists watchCount] && [my set watchCount]!=0}
}
