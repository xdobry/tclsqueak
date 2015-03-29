IDE::ClassDefinition proc redefineClass {class view} {
    set cobj [$view getActualComponentObject]
    set introProxy [$cobj getIntroProxy]
    set superclass [$introProxy getSuperclassForClass $class]
    set parameter [$introProxy getParameterForClass $class]
    if {$superclass in {::Object ::xotcl::Object ::oo::object}} { set superclass ""}
    return [my create [Object autoname changeBrowser] [Object autoname .cdbrowser] -classView $view -superclassList $superclass -mode redefine -parameter $parameter -className $class]
}
