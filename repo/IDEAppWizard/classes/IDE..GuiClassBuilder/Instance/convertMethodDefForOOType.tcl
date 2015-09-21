IDE::GuiClassBuilder instproc convertMethodDefForOOType {def ootype} {
    if {$ootype ne "TclOO"} {
        error "unsupported ootype $ootype"
    }
    set defmethod oo::define
    if {[lindex $def 1] eq "proc"} {
        set defmethod oo::objdefine
    }
    set body [lindex $def end]
    regsub -all {my instvar } $body {my variable } body
    # oo::define OOClass method foo {} {...body...}
    if {[lindex $def 1] eq "instproc" && [lindex $def 2] eq "destroy"} {
        return [list  $defmethod [lindex $def 0] destructor $body]
    }
    if {[lindex $def 1] eq "instproc" && [lindex $def 2] eq "init"} {
        return [list  $defmethod [lindex $def 0] constructor [lindex $def 3] $body]
    }
    list  $defmethod [lindex $def 0] method [lindex $def 2] [lindex $def 3] $body
}
