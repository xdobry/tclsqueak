IDE::TParser instproc testAParsingCmdSubstitution2 {} {
    set script {
        set a [list \] {]} "]"]
    }
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal $script
    my assert {![$context hasErrors]} [$context set errors]
}
