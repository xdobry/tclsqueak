IDE::TCodeCompletionOO instproc checkCompletion {code expectedResult} {
    set result [my makeCompletion $code]
    if {[llength $expectedResult]==0} {
        my assert {[llength $result]==0}
    } else {
        my assert {[llength $result]==2} "$code expected $expectedResult"
        set result [lindex $result 0]
        my assert {[lsort $result] eq [lsort $expectedResult]} $code
    }
}
