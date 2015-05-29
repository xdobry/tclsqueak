IntroSignatureRepository instproc getFullObjectName {object {namespace {}}} {
    #ttc vartype object xotcl
    if {$namespace ne "" && [namespace exists $namespace]} {
        if {[namespace eval $namespace [list ::xotcl::Object isobject $object]]} {
            if {$::tcl_version>=8.6 && $::xotcl::version==1.9} {
                return [namespace eval $namespace [list [info object name $object]]]
            } else {
                return [namespace eval $namespace $object]
            }
        }
    }
    if {[Object isobject $object]} {
        if {$::tcl_version>=8.6 && $::xotcl::version==1.9} {
            return [info object name $object]
        } else {
            return [$object]
        }
    } else {
        return $object
    }
}
