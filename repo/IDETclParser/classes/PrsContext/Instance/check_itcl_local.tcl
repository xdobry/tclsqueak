PrsContext instproc check_itcl_local {count command notifier} {
    my instvar repository namespace parser localObject
    if {$count>=2} {
        set classElem [$command getElem 1]
        if {[$classElem hasclass PrsLiteral]} {
            set class [$classElem prsString]
            if {"::itcl::object" ni [$repository getFullHeritage $class $namespace]} {
                $notifier "need to be itcl class" $classElem
                return
            }
            set nameElem [$command getElem 2]
            set desc [$repository getMethodDescriptionForObject $class create $namespace]
            if {$desc ne ""} {
                my checkParametersToDesc $command $notifier 2 $desc
                if {[$nameElem hasclass PrsLiteral]} {
                    set localObject([$nameElem prsString]) [$repository getFullObjectName $class $namespace]
                } elseif {[$nameElem hasclass PrsVariable]} {
                    set type [list class [$repository getFullObjectName $class $namespace]]
                    if {[$nameElem isArray]} {
                        set type [linsert $type 0 array]
                    }
                    my checkVariableType [$nameElem getVariableName] $type 1
                }
            }
        }
    }
}
