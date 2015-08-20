IDE::TScriptParsing instproc testKBug20 {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        package require Tk
        set w .w
        bind $w.plqr0 <<Scroll>> {+ puts via}
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
