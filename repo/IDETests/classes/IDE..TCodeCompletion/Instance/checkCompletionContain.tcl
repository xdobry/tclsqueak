IDE::TCodeCompletion instproc checkCompletionContain {code expectedElement} {
    set result [my makeCompletion $code]
    my assert {[llength $result]==2} "$code expected $expectedElement"
    set result [lindex $result 0]
    my assert {$expectedElement in $result} $code
}
