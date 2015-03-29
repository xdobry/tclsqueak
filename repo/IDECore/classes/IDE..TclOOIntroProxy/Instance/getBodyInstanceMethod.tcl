IDE::TclOOIntroProxy instproc getBodyInstanceMethod {obj p} {
    if {$p in {destroy create new eval unknown variable varname}} {
        return "oo::define $obj method $p { # build in }\n"
    }
    if {$obj ni {::oo::class oo::class}} {
        if {$p eq "_constructor"} {
            return "oo::define $obj constructor [info class constructor $obj]\n"
        } elseif {$p eq "_destructor"} {
            return "oo::define $obj destructor {[info class destructor $obj]}\n"
        }
    }
    return "oo::define $obj method $p [info class definition $obj $p]\n"
}
