IDE::TclGroupDefinition instproc actionCreate {} {
    my instvar isnamespace groupName classView
    if {[my checkClassView]} {
        if {[my mode] eq "redefine"} {
            # !!!
        } else {
            if {![my getValuesFromGUI]} return
            $classView createTclProcsGroup $groupName $isnamespace
        }
    }
    my destroy
}
