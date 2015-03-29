OOIntroSignatureRepository instproc getMethodDescFromIntro {object type method} {
    #ttc vartype object xotcl ::xotcl::Class
    if {![info object isa object $object]} {
        return
    }
    #puts "$object $type $method"
    if {$type eq "inst"} {
        if {![info object isa class $object]} {
            return
        }
        if {$method ni [info class methods $object]} {
            return
        } else {
            if {$method eq "destroy"} {
                return [list [list $object ${type}proc $method] void]
            }
            set argList [lindex [info class definition $object $method] 0]
        }
    } else {
        if {$method ni [info object methods $object -all]} {
            return
        } else {
            if {$method in {new create destroy}} {
                switch $method {
                    new {
                        if {$object in {::oo::class ::oo::object}} {
                            set contructorParams {{* string}}
                        } else {
                            set contructorParams [my getTypesFromArgs [lindex [info class constructor $object] 0]]
                        }
                        return [list [list $object ${type}proc $method] [list [list [list class $object]] {*}$contructorParams]]
                    }
                    create {
                        if {$object in {::oo::class ::oo::object}} {
                            set contructorParams {{* string}}
                        } else {
                            set contructorParams [my getTypesFromArgs [lindex [info class constructor $object] 0]]
                        }
                        return [list [list $object ${type}proc $method] [list [list [list class $object]] {string {object name}} {*}$contructorParams]]
                    }
                    destroy {
                        return [list [list $object ${type}proc $method] void]
                    }
                }
            }
            set argList [lindex [info object definition $object $method] 0]
        }
    }
    set types [list unknown {*}[my getTypesFromArgs $argList]]
    list [list $object ${type}proc $method] $types
}
