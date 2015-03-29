IDE::TestBrowser instproc initTestCasesList {} {
    my instvar win testRunner testRef idArr
    set testRef [dict create]
    foreach case [$testRunner getAllTestCases] {
        lassign $case class methods
        set id [$win.tree insert {} end -text $class]
        dict set testRef $class _root id $id
        foreach m $methods {
            set cid [$win.tree insert $id end -text $m]
            dict set testRef $class $m id $cid
            set idArr($cid) [list $class $m]
        }
    }
}
