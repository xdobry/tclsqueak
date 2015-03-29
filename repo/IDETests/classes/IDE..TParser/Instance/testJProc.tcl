IDE::TParser instproc testJProc {} {
    # check parsing errors
    set script {proc testproc {a b} {
        puts ewewe
    }}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[$context set name] eq "testproc"}
    my assert {[$context set isTclproc]}
    my assert {![$context hasErrors]}
    
}
