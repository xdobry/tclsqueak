IDE::TParser instproc testHFileSubcommand {} {
    # check parsing errors
    my initTestClass
    set script {IDE::TestA instproc t1 {a b} {
    file parent $b
}}
    set context [PrsContext new -childof [self]]
    $context parseAndCheck $script
    my assert {[$context hasErrors]} [$context set errors]

}
