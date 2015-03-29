IDE::ClassDefinition instproc actionTemplate {} {
    my instvar classView
    set def [my getClassDefinition]
    if {$def eq ""} return
    if {[my checkClassView]} {
        $classView setEditText $def
        $classView set vclass {}
    }
    my destroy
}
