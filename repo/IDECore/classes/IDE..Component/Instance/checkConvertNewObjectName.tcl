IDE::Component instproc checkConvertNewObjectName newObjectName {
    set ns [my getNamespace]
    set pns [namespace qualifiers $newObjectName]
    if {$pns ne "" && $ns eq ""} {
        set introProxy [my getIntroProxy]
        if {[$introProxy isObject $pns]} {
            return $newObjectName
        } else {
            # component has no namespace but the newObjectName requires it
            return ""
        }
    } elseif {$pns eq "" && $ns ne ""} {
        return ${ns}::[namespace tail $newObjectName]
    } elseif {$pns ne "" && $ns ne ""} {
        set tns [string trimleft $ns :]
        set ptns [string trimleft $pns :]
        if {$tns eq $ptns} {
            return ${ns}::[namespace tail $newObjectName]
        } elseif {$tns eq [string range $ptns 0 [string length $tns]]} {
            # case
            # namespace::SubClass::NewClass
            if {[$introProxy isObject $pns]} {
                return $newObjectName
            }
        }
        return
    } else {
        # ns eq "" && pns eq ""
        return $newObjectName
    }

}
