IntroSignatureRepository instproc getCommandDescription {name {namespace {}}} {
    if {[set desc [my getCommandDescriptionBase $name $namespace]] ne ""} {
        return $desc
    } elseif {[llength [info procs $name]]>0} {
        return [my getProcDescFromIntro $name]
    } else {
        if {$namespace ne ""} {
            set oname [namespace eval $namespace [list namespace which -command $name]]
            if {[llength [info procs $oname]]>0} {
                return [my getProcDescFromIntro $oname]
            }
        }
    }
    if {[llength [info commands $name]]>0} {
        return [list $name 0 -1]
    }
}
