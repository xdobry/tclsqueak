IDE::TScriptParsing instproc testDUplevelList {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {
        proc foo {} {
            set a [uplevel set argv]
        }
    }
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
