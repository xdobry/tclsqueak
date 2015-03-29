IDE::TParser instproc testFCheck {} {
    # check defining of local varibles evaluating of scripts in command
    my initTestClass
    set script {TestA instproc t333 {a b} {
            set c d
            puts $c
            foreach d $a {
                my unknownMethod $a $b
            }
            my set e g
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[llength [$context getVariableNames]]==5}
    my assert {[$context hasErrors]}
    my assert {[llength [$context errors]]==1}
    my assert {[regexp method [$context errors]]}
}
