IDE::Component instproc getInitScript {} {
    my instvar requiredComp version
    set initscript {}
    set introProxy [my getIntroProxy]
    foreach object [my getObjectDefineList] {
        if {"initializeAfterLoad" in [$introProxy getClassMethods $object _all_categories]} {
            append initscript "catch {$object initializeAfterLoad}\n"
        }
    }
    return $initscript
}
