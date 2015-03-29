IDE::TclOOIntroProxy instproc getClassDefinition {class superclasses parameters} {
    set def "oo::class create $class"
    set add ""
    if {[llength $superclasses]>0} {
        append add "    superclass $superclasses\n"
    }
    if {$parameters ne ""} {
        append add "    variable $parameters\n"
    }
    if {$add ne ""} {
        append def " {\n$add}"
    }
    return $def
}
