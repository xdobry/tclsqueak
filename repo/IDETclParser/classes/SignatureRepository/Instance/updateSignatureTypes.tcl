SignatureRepository instproc updateSignatureTypes {desc types} {
    my instvar methodsArr commandsArr
    tlog::ltrace {updateSignatureTypes $desc types=$types}
    if {[llength $desc]==2} {
        set repositoryKey [lindex $desc 0]
        if {[llength $repositoryKey]==1} {
            if {[info exists commandsArr($repositoryKey)]} {
                set mergedTypes [my mergeTypes [lindex $desc 1] $types]
                if {$mergedTypes ne ""} {
                    tlog::linfo {update command $repositoryKey types='$types' desc='$desc' merge='$mergedTypes'}
                    lset desc 1 $mergedTypes
                    set commandsArr($repositoryKey) [lrange $desc 1 end]
                }
            }
            # check if it is static itcl method (proc) if yes update also definition of it
            set objname [namespace qualifiers $repositoryKey]
            if {[my getXotclClassForObject $objname] eq "::itcl::class"} {
                set fullName [list $objname proc [namespace tail $repositoryKey]]
                set mdesc [my getMethodDescription $fullName]
                if {[llength $mdesc]>0} {
                    my updateSignatureTypes $mdesc $types
                }
            }
        } else {
            if {[info exists methodsArr($repositoryKey)]} {
                set mergedTypes [my mergeTypes [lindex $desc 1] $types]
                if {$mergedTypes ne ""} {
                    tlog::linfo {update method $repositoryKey types='$types' desc='$desc' merge='$mergedTypes'}
                    lset desc 1 $mergedTypes
                    set methodsArr($repositoryKey) [lrange $desc 1 end]
                }
            }
        }
    }
}
