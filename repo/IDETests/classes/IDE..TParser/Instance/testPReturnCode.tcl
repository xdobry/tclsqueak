IDE::TParser instproc testPReturnCode {} {
    # check for array parsing
    set script {proc t1 {code} {
        return -code error $code
    }
    proc t2 {value} {
        t1 $value
    }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {![$context hasErrors]}
}
