IDE::TScriptParsing instproc testCADefArray {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
    global tcl_platform
    global tcl_platform
    }}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
