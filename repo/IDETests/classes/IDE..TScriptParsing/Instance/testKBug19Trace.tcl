IDE::TScriptParsing instproc testKBug19Trace {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        set vars(expcd.limitsel) 2
        trace add variable vars(expcd.limitsel) write setExpCDLimits
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
