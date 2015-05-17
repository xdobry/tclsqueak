IDE::ClassView instproc refreshNavigation class {
    my instvar vtype vclass procsGroup cobj
    my setSelectedItem $class 0
    if {[Object isobject [my info parent]::methodcatview]} {
        [my info parent]::methodcatview selectFor $class $vtype [my getIntroProxy]
    }
    if {$class eq ""} {
        set vclass {}
        return
    }
    if {$vtype eq "Procs"} {
        set procsGroup [$cobj getProcsGroupWithName $class]
        set vclass $procsGroup
    } else {
        set vclass $class
    }
}
