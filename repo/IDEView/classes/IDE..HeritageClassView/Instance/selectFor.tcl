IDE::HeritageClassView instproc selectFor {class {pintroProxy {}}} {
    my instvar hlist vclass vtype introProxy
    if {$pintroProxy eq ""} {
        set introProxy [IDE::XOIntroProxy getIntroProxy]
    } else {
        set introProxy $pintroProxy
    }
    if {$vtype eq "heritage"} {
       my setHList [list [$introProxy getHeritageForClass $class]]
    } elseif {$vtype eq "children"} {
       my setHList [list [$introProxy getChildrenHierarchyForClass $class]]
    }
    set vclass $class
}
