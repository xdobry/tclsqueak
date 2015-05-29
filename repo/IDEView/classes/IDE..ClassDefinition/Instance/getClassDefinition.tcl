IDE::ClassDefinition instproc getClassDefinition {} {
    my instvar win classView compObj
    set introProxy [$compObj getIntroProxy]
    set name [$win.fname.name get]
    if {$name eq ""} {
        IDE::Dialog error "You must specify new name for the class"
        return
    }
    set name [$compObj checkConvertNewObjectName $name]
    if {$name eq ""} {
        IDE::Dialog error "Wrong name for class in component ns: [$compObj getNamespace]"
        return
    }
    set parameter [my getParameter]
    if {![info complete $parameter]} {
        IDE::Dialog error "Parameter are not proper Tcl list"
        return
    }
    set superclass [my @superclass getList]
    $introProxy getClassDefinition $name $superclass $parameter
}
