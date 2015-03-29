IDE::TParser instproc testMSpecialStrings {} {
    set script {TestA instproc t1 {a b} {
            # no syntax check
            nonsense 1
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {![$context hasErrors]}

    set script {TestA instproc t1 {a b} {
            #ttc vartype c string
            #ttc vartype d string
            puts "$c $d"
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {![$context hasErrors]}
}
