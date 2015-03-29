IDE::TParser instproc testOLmap {} {
    # check for array parsing
    set script {TestA instproc t1 {a b} {
        set values {1 2 3 4 5}
        lmap x $values {expr {$x+1}}
    }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {![$context hasErrors]}


    set script {TestA instproc t1 {a b} {
        set values {1 2 3 4 5}
        lmap x $values {expr {$a+1}}
    }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[$context hasErrors]}

}
