IDE::TParser instproc testAParsingQuotingSubstitution {} {
    set script {
        set a "[list a" {"}]"
    }
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal $script
    my assert {![$context hasErrors]} [$context set errors]
}
