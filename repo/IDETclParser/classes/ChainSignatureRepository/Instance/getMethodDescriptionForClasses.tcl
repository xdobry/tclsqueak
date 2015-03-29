ChainSignatureRepository instproc getMethodDescriptionForClasses {classes method {namespace {}} {object {}}} {
    my instvar xotclArr writeRepository repositoryChain
    foreach cl $classes {
        set fullCl [my getFullObjectName $cl $namespace]
        foreach c [my getFullHeritage $fullCl] {
            set fname [list $c instproc $method]
            #puts "scaning $c for $method"
            set desc [my getMethodDescription $fname]
            if {$desc ne ""} {
                if {$c eq "::xotcl::Class" && $method in {new alloc create}} {
                    lset desc 1 0 [list [list xotcl $object]]
                }
                if {$c eq "::oo::class" && $method in {new create}} {
                    lset desc 1 0 [list [list class $object]]
                }
                return $desc
            }
            foreach r $repositoryChain {
                set desc [$r getMethodDescFromIntro $c inst $method]
                if {$desc ne "" } {
                    return $desc
                }
            }
            foreach param [$writeRepository getClassParameters $c $namespace] {
                set paramName [lindex $param 0]
                if {$paramName eq $method} {
                    set type [my getVariableType $fullCl instproc $paramName $namespace]
                    if {$type eq ""} {
                        set type unknown
                    }
                    return [list $c [list [list $type parameter] [list ? $type]]]
                }
            }
        }
    }

    return
}
