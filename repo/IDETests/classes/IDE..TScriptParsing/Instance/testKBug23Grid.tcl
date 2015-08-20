IDE::TScriptParsing instproc testKBug23Grid {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        grid .r.l -in .r -stick new -pady 5 -padx 10
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
