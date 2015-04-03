IDE::ClassDescription instproc setDefBody body {
    my instvar trackBodyChanges
    # objectid not exists if object is loaded for first time (no reread)
    # by reread by loading anther version objectid is already initialized
    if {[my exists objectid]} {
        set introProxy [my getCompIntroProxy]
        lassign [$introProxy parseClassDefinition $body] superclass parameter
        set trackBodyChanges 0
        my setParameterReread $parameter
        my setSuperclassReread $superclass
        set trackBodyChanges 1
    }
}
