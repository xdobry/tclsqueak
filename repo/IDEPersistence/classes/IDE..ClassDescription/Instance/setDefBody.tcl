IDE::ClassDescription instproc setDefBody body {
    # objectid not exists if object is loaded for first time (no reread)
    # by reread by loading anther version objectid is already initialized
    if {[my exists objectid]} {
        set introProxy [my getCompIntroProxy]
        lassign [$introProxy parseClassDefinition $body] superclass parameter
        my setParameterReread $parameter
        my setSuperclassReread $superclass
    }
}
