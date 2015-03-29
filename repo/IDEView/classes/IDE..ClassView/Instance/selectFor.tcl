IDE::ClassView instproc selectFor component {
    my instvar vcomponent vtype cobj treeView
    set vcomponent $component
    if {$component eq ""} {
        my resetList
        set cobj {}
        [my info parent]::methodcatview selectFor {} $vtype {}
        return
    }
    set mtype $vtype
    set cobj [IDE::Component getCompObjectForNameIfExist $vcomponent]
    if {$cobj eq ""} {error "Can find component object for $vcomponent"}
    if {$mtype eq "Procs"} {set mtype ProcsGroups}
    set introProxy [$cobj getIntroProxy]
    if {$treeView && $vtype eq "Classes"} {
        my setHList [$cobj getClassesHierarchy]
    } else {
        my setList [lsort [$introProxy get${mtype}ForComponent $component]]
    }
    foreach s {Classes Objects Procs} n {Classes Objects ProcsGroups} {
        my @stateButton setStateAddInfo $s [format %2i [llength [$introProxy get${n}ForComponent $component]]]
    }
    my selectItem {}
}
