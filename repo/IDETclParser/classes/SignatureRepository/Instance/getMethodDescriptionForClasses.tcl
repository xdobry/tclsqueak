SignatureRepository instproc getMethodDescriptionForClasses {classes method {namespace {}} {object {}}} {
    my instvar methodsArr
    foreach cl $classes {
        set fullCl [my getFullObjectName $cl $namespace]
        foreach c [my getFullHeritage $cl] {
            set fname [list $c instproc $method]
            set desc [my getMethodDescription $fname]
            #puts "c $c - $desc"
            if {$desc ne ""} {
                if {$c eq "::xotcl::Class" && $method in {new alloc create}} {
                    lset desc 1 0 [list [list xotcl $object]]
                }
                if {$c eq "::oo::class" && $method in {new create}} {
                    lset desc 1 0 [list [list class $object]]
                }
                return $desc
            }
            set desc [my getMethodDescFromIntro $c inst $method]
            if {$desc ne "" } {
                return $desc
            }

            #foreach param [my getClassParameters $c] {
            #    set paramName [lindex $param 0]
            #    if {$paramName eq $method} {
            #        set type [my getVariableType $fullCl instproc $paramName $namespace]
            #        if {[lindex $type 0] eq "def"} {
            #            set type [list unknown]
            #        }
            #
            #    }
            #}
        }
    }

    return
}
