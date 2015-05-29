IDE::ClassDefinition instproc actionCreate {} {
    my instvar classView mode className introProxy compObj
    if {[my checkClassView]} {
        if {$mode eq "redefine"} {
            set parameter [my getParameter]
            set superclass [my @superclass getList]
            $introProxy redefineClass $className $superclass $parameter
        } else {
            set def [my getClassDefinition]
            if {$def eq ""} return
            $classView editSave $def [list $className [$introProxy getSpecialMethodType Def] [$compObj getName]]
        }
    }
    my destroy
}
