PrsContext instproc xocheck_create {count type object command notifier {startParam 2}} {
    my instvar repository namespace
    if {[$repository isXotclMetaClass $object]} {
        # class definition
        set nameElem [$command getElem $startParam]
        if {$nameElem ne "" && [$nameElem hasclass PrsLiteral]} {
            set name [$nameElem prsString]
            tlog::info "define xotcl class $name"
            set superclasses ""
            set parameters ""
            incr startParam
            for {set i $startParam} {$i<$count} {incr i} {
                set parElem [$command getElem $i]
                if {[$parElem hasclass PrsLiteral]} {
                    set par [$parElem prsString]
                    if {$par eq "-superclass"} {
                        incr i
                        set parValueElem [$command getElem $i]
                        if {$parValueElem ne "" && ([$parValueElem hasclass PrsLiteral] || [$parValueElem hasclass PrsNoSubst])} {
                            $parValueElem extractList
                            foreach par [$parValueElem getAsList] {
                                set sclass [$par prsString]
                                set fnsclass [$repository getFullObjectName $sclass $namespace]
                                if {$fnsclass eq ""} {
                                    my addError "is not a class" $par
                                } else {
                                    set sclass $fnsclass
                                }
                                lappend superclasses $sclass
                            }
                        }
                    } elseif {$par eq "-parameter"} {
                        incr i
                        set parValueElem [$command getElem $i]
                        if {$parValueElem ne "" && ([$parValueElem hasclass PrsLiteral] || [$parValueElem hasclass PrsNoSubst])} {
                            $parValueElem extractList
                            foreach par [$parValueElem getAsList] {
                                $par extractList
                                lappend parameters [[lindex [$par getAsList] 0] prsString]
                            }
                        }
                    }
                }
            }
            if {[llength $superclasses]==0} {
                lappend superclasses ::xotcl::Object
            }
            set fullName [$repository registerObject $name Class $superclasses $parameters $namespace]
            [$command getElem 0] set def [list object $fullName]
        }
    } elseif {[$repository isXotclClass $object]} {
        set nameElem [$command getElem $startParam]
        if {$nameElem ne "" && [$nameElem hasclass PrsLiteral]} {
            set name [$nameElem prsString]
            set fullClass [$repository getFullObjectName $object $namespace]
            # do not register #auto names for itcl
            if {[string first #auto $name]<0 || "::itcl::object" ni [$repository getFullHeritage $fullClass]} {
                set fullName [$repository registerObject $name $fullClass {} {} $namespace]
                [$command getElem 0] set def [list object $fullName]
            }
        } elseif {$nameElem ne "" && [regexp {\[self\]::(.+)} [$nameElem prsString] _ name]} {
            if {[my exists object]} {
                $repository registerVariable [my set object] subobject $name {} [$repository getFullObjectName $object $namespace]
            }
        }
    }
}
