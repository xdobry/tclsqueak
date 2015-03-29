IntroSignatureRepository instproc getFullObjectName {object {namespace {}}} {
    #ttc vartype object xotcl
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
