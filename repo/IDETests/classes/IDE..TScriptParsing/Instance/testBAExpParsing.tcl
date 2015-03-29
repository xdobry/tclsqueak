IDE::TScriptParsing instproc testBAExpParsing {} {
    set context [PrsFileContext new -childof [self]]
    $context parseGlobal {set a 10}
    $context parseGlobal {set b [expr {$a+1}]}
    my assert {[llength [$context set errors]]==0}
    set repository [$context set repository]
    set atype [$repository getVariableType {} global a]
    my assert {$atype eq "int"}
    set btype [$repository getVariableType {} global b]
    my assert {$btype eq "int"}
    $context parseGlobal {set c [expr {($a+1)}]}
    set btype [$repository getVariableType {} global c]
    my assert {$btype eq "int"}
    $context parseGlobal {set d [expr {int(1.2)}]}
    set btype3 [$repository getVariableType {} global d]
    my assert {$btype3 eq "int"}
    $context parseGlobal {set e [expr {sin(1.2)}]}
    set btype [$repository getVariableType {} global e]
    my assert {$btype eq "double"}
    $context parseGlobal {set f [expr {abs(1)}]}
    set btype2 [$repository getVariableType {} global f]
    my assert {$btype2 eq "int"}
    $context parseGlobal {set g [expr {abs(1.2)}]}
    set btype [$repository getVariableType {} global g]
    my assert {$btype eq "double"}
    $context parseGlobal {set h [expr {int(-1)}]}
    set btype [$repository getVariableType {} global h]
    my assert {[llength [$context set errors]]==0}
    my assert {$btype eq "int"}

    $context parseGlobal {expr {1!=1-1 && 1==1 && 1==1+1}}

    my assert {[llength [$context set errors]]==0}
}
