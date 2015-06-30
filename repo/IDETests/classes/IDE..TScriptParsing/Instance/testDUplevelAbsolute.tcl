IDE::TScriptParsing instproc testDUplevelAbsolute {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        proc foo {} {
            set a [uplevel #0 {set argv}]
        }
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
