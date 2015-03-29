IDE::TParser instproc testHParsingErrors {} {
    # check parsing errors
    my initTestClass
    set script {TestA instproc t1 {a b} {
            puts [test
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[[$context parser] hasParseErrors]}

    set script {TestA instproc t1 {a b} {
            puts "test
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[[$context parser] hasParseErrors]}

    set script {TestA instproc t1 {a b} {
            if {[ew} {puts yee}
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[[$context parser] hasParseErrors]}

    set script {TestA instproc t1 {a b} {
            puts "[ewre"
            }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[[$context parser] hasParseErrors]}

}
