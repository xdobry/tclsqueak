IDE::ClassDefinition proc redefineClass {class view compObj} {
    set introProxy [$compObj getIntroProxy]
    set superclass [$introProxy getSuperclassForClass $class]
    set parameter [$introProxy getParameterForClass $class]
    if {[$introProxy isRootClass $superclass]} {
        set superclass [list]
    }
    my create [Object autoname changeBrowser] [Object autoname .cdbrowser] -classView $view -superclassList $superclass -mode redefine -parameter $parameter -className $class -compObj $compObj
}
