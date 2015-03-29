IDE::TclGroupDefinition instproc checkClassView {} {
    my instvar classView
    return [Object isobject $classView]
}
