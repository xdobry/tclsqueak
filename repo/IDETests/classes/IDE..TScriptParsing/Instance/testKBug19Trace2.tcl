IDE::TScriptParsing instproc testKBug19Trace2 {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set hmvarname a
        trace add variable $hmvarname write doHideMgmt
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
