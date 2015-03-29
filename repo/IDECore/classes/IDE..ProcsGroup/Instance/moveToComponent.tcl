IDE::ProcsGroup instproc moveToComponent component {
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    if {$cobj eq ""} {error "Component $component does not exists"}
    set newName ${cobj}::[Object autoname group]
    my move $newName
    # !!! Design problem. Dependency to Persistance component
    if {![$newName isPersistent]} {
        $cobj addProcsGroup $newName
    } else {
        $newName afterMoveToComponent
    }
}
