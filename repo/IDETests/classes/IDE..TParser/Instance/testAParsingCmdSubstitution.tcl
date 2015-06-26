IDE::TParser instproc testAParsingCmdSubstitution {} {
    set script {
        set a [list "]"]
    }
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal $script
    my assert {![$context hasErrors]} [$context set errors]
}
