IDE::TScriptParsing instproc testCDupvar {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
    upvar $a abb
    incr abb
    }}
    $context parseGlobal {foo a}
    $context parseGlobal {puts $a}

    my assert {[llength [$context set errors]]==0} [$context set errors]
}
