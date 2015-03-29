IDE::TParser instproc testECheckInstproc {} {
    # check ease method call and arguments counts
    my initTestClass
    set script {TestA instproc t21 {a b} {
            puts test
            # 1 0
            puta $d
            my m1 $a
            # 2
            my unknownMethod $a $b
            $a nocheck
            # 3
            my m1 1 2
            # comment
            # 4
            my m1
            # this should not produce errors
            my m3 1 2 3
            my m3 1 2
            my m4 1
            my m4
            my m4 1 2
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    # await some errors
    my assert {[$context set isInstproc]}
    my assert {![$context set isTclproc]}
    my assert {[$context set name] eq "t21"}
    my assert {[$context hasErrors]}
    my assert {[llength [$context errors]]==5}

    #my assert {[regexp variable [lindex [$context errors] 0]]}
    #my assert {[regexp proc [lindex [$context errors] 1]]}
    #my assert {[regexp method [lindex [$context errors] 2]]}
    #my assert {[regexp parameter [lindex [$context errors] 3]]}
    #my assert {[regexp parameter [lindex [$context errors] 4]]}


    $context destroy
}
