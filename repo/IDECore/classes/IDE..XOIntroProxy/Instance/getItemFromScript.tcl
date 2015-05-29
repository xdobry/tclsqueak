IDE::XOIntroProxy instproc getItemFromScript script {
    set nclass [lindex $script 0]
    set ntype [lindex $script 1]
    set nmethod [lindex $script 2]
    # TODO TclOO specific
    if {$nclass eq "oo::define"} {
        set ntype OOInstance
        set nclass [lindex $script 1]
        set dtype [lindex $script 2]
        if {$dtype eq "method"} {
            set nmethod [lindex $script 3]
        } elseif {$dtype eq "constructor"} {
            set nmethod _constructor
        } elseif {$dtype eq "destructor"} {
            set nmethod _destructor
        }
    } elseif {$nclass eq "oo::objdefine"} {
        set ntype OOClass
        set nclass [lindex $script 1]
        set nmethod [lindex $script 3]
    } elseif {$nclass ne "proc"} {
       if {$ntype eq "instproc"} {
           set ntype Instance
       } else {
           set ntype Class
       }
    } elseif {$nclass eq "proc"} {
        set nmethod $ntype
        set ntype Procs
        set nclass {}
    }
    list $nclass $ntype $nmethod
}
