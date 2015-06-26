PrsMarkupVisitor instproc getCoreLinkForKey refKey {
    my instvar tclCommands tkCommands packageArr
    set type [lindex $refKey 0]
    if {$type eq "proc"} {
        set name [string trimleft [lindex $refKey 1] :]
        if {$name in $tclCommands} {
            return "http://www.tcl.tk/man/tcl8.5/TclCmd/$name.htm"
        } elseif {$name in $tkCommands} {
            return "http://www.tcl.tk/man/tcl8.5/TkCmd/$name.htm"
        }
    } elseif {$type eq "object"} {
        set objname [lindex $refKey 1]
        if {$objname eq "::xotcl::Object"} {
            return "http://media.wu.ac.at//doc/langRef-xotcl.html#Object"
        } elseif {$objname eq "::xotcl::Class"} {
            return "http://media.wu.ac.at//doc/langRef-xotcl.html#Class"
        }
    } elseif {$type eq "method"} {
        lassign [lindex $refKey 1] objname methodtype method
        if {$objname eq "::xotcl::Object" && $methodtype eq "instproc" && $method in {abstract append array autoname check class cleanup configure contains copy eval exists extractConfigureArg filter filterguard filtersearch forward getExitHandler hasclass incr info invar isclass ismetaclass ismixin isobject istype lappend mixin move noinit parametercmd procsearch requireNamespace setExitHandler subst trace unset uplevel upvar volatile vwait}} {
            return "http://media.wu.ac.at//doc/langRef-xotcl.html#Object-$method"
        } elseif {$objname eq "::xotcl::Class" && $methodtype eq "instproc" && $method in {unknown allinstances alloc info instdestroy instfilter instfilterguard instforward instinvar instmixin instparametercmd parameter parameterclass recreate superclass}} {
            return "http://media.wu.ac.at//doc/langRef-xotcl.html#Class-$method"
        }
    } elseif {$type eq "package"} {
        set packageName [lindex $refKey 1]
        if {![catch {set packageArr($packageName)} ref]} {
            return $ref
        }
    }
    return
}
