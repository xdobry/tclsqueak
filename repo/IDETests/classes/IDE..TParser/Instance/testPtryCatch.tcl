IDE::TParser instproc testPtryCatch {} {
    # check for array parsing
    set script {TestA instproc t1 {a b} {
        try {
            throw {MYERR} {test error}
        } trap {MYERR} {
            puts myerr
        } finally {
            puts finally
        }
    }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {![$context hasErrors]}
}
