IDE::ChangesBrowser instproc compareComponents {c1 c2} {
    my instvar comp1 comp2 compArr1 compArr2
    set comp1 $c1
    set comp2 $c2
    $c1 setObjectsArray compArr1
    $c2 setObjectsArray compArr2
    [self]::classes setList [my getDiffFromArrays compArr1 compArr2]
    my setCompareLabels "[$comp1 getName] [$comp1 set componentid]" "[$comp2 getName] [$comp2 set componentid]"
}
