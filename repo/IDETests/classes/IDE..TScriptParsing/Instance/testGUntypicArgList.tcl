IDE::TScriptParsing instproc testGUntypicArgList {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        proc bar { } {
            return 1
        }
        bar
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
