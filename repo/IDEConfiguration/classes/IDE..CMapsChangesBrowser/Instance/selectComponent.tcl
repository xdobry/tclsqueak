IDE::CMapsChangesBrowser instproc selectComponent cname {
    my instvar cmap1 cmap2 cmapArr1 cmapArr2 comp1 comp2 compArr1 compArr2
    catch {unset compArr1 compArr2}
    if {[info exists cmapArr1($cname)]} {
        set comp1 [my getComponentWithId $cmapArr1($cname)]
        $comp1 setObjectsArray compArr1
        set lab1 "[$comp1 getName] [$comp1 set componentid]"
    } else {
        set comp1 {}
        set lab1 "not exists"
    }
    if {[info exists cmapArr2($cname)]} {
        set comp2 [my getComponentWithId $cmapArr2($cname)]
        $comp2 setObjectsArray compArr2
        set lab2 "[$comp2 getName] [$comp2 set componentid]"
    } else {
        set lab2 "not exists"
        set comp2 {}
    }
    [self]::classes setList [my getDiffFromArrays compArr1 compArr2]
    my setCompareLabels $lab1 $lab2
}
