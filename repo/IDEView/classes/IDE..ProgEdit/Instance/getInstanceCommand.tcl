IDE::ProgEdit instproc getInstanceCommand pattern {
    # class shoul be the first word in the window
    set twin [my getTextWindow]
    set class [$twin get 1.0 {1.0 lineend}]
    regexp {(^[\w:]+)\s+(\w+)} $class _ class method
    if {![Object isobject $class]} return
    set mlist {}
    if {![Object isclass $class] || $method eq "proc"} {
        set mlist [$class info procs $pattern]
        set mlist [concat $mlist [lsearch -inline -all [list create instdestroy instfilter instfilterappend instfilterguard instinvar instmixin instmixinappend instparametercmd instproc insttclcmd new] $pattern]]
    } else {
        foreach hclass [concat $class [$class info heritage]] {
            if {$hclass eq "::xotcl::Object"} continue
            set mlist [concat $mlist [$hclass info instprocs $pattern]]
            foreach par [$hclass info parameter] {
                set pname [lindex $par 0]
                if {[string match $pattern $pname]} {
                    lappend mlist $pname
                }
            }
        }
    }
    set mlist [concat $mlist [lsearch -inline -all [list abstract append array autoname check class copy destroy eval exists filter filterappend filterguard filtersearch hasclass incr info instvar invar isclass ismetaclass ismixin isobject istype lappend mixin mixinappend move requireNamespace set setExitHandler trace unset vwait] $pattern]]
    set mlist [lsort -unique $mlist]
    my invokePopDown $mlist $pattern
}
