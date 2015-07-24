IDE::CodeCompletion instproc getClassMethods {introProxy class {pattern {}}} {
    set mlist [$introProxy getClassMethods $class]
    if {[$introProxy getOOSystemName] eq "XOTcl"} {
        lappend mlist {*}[::xotcl::Class info instcommands]
        lappend mlist {*}[::xotcl::Object info instcommands]
    }
    if {[$introProxy getOOSystemName] eq "TclOO"} {
        lappend mlist new create destroy
    }
    if {$pattern ne ""} {
        set mlist [ide::lselect each $mlist {[string match $pattern $each] && $each ne $pattern}]
    }
    return $mlist
}
