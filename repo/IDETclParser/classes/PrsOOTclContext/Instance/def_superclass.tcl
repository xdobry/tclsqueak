PrsOOTclContext instproc def_superclass {command startArg notifier} {
    my instvar repository name namespace superclasses
    my checkArgCount $command $startArg $notifier 1 -1
    set count [$command argsCount]
    set superclasses [list]
    for {set i $startArg} {$i<=$count} {incr i} {
        set classElem [$command getElem $i]
        if {[$classElem hasclass PrsLiteral]} {
            set className [$classElem prsString]
            # even in 2-nd pass the whole class hierarchy may not be build
            # because of specific file parsing order therefore it could be that
            # the class is not yet recognized as ::oo::object
            # test only on object
            # if {"::itcl::object" ni [$repository getFullHeritage $className $namespace]}
            if {[llength [$repository getFullHeritage $className $namespace]]==0} {
                $notifier addError "is not TclOO class" $classElem
            } else {
                [$command getElem $i] set ref [list object [$repository getFullObjectName $className]]
                lappend superclasses $className
            }
        }
    }
    $repository registerObject $name ::oo::class $superclasses {} $namespace
}
