IDE::Component::Tracker proc setOn {} {
    my trackClass Class
    my trackClass Object
    namespace eval :: {
        proc procNew args {
            set evalns [uplevel {namespace current}]
            uplevel procOld $args
            set procname [uplevel namespace origin [lindex $args 0]]
            eval IDE::Component::Tracker trackProc $procname [lrange $args 1 end]
        }
        rename proc procOld
        rename procNew proc
    }
}
