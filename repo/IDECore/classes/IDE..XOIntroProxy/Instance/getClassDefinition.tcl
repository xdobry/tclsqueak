IDE::XOIntroProxy instproc getClassDefinition {class superclasses parameters} {
    set def "Class $class"
    if {[llength $superclasses]>0} {
        append def " -superclass [list $superclasses]"
    }
    if {$parameters ne ""} {
        append def " -parameter [list $parameters]"
    }
    return $def
}
