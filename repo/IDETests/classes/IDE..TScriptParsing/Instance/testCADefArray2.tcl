IDE::TScriptParsing instproc testCADefArray2 {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {proc foo {a} {
    upvar #0 $a abb
    puts $abb(1)
    upvar $a abb
    }}
    my assert {[llength [$context set errors]]==0} [$context set errors]

    $context parseGlobal {proc foo2 {a} {
        global arr arr2 arr3
        lappend arr(2) wert
        append arr2(2) wert
        incr arr3(2) 2
    }}
    my assert {[llength [$context set errors]]==0} [$context set errors]
}
