IDE::Component::Tracker proc setOff {} {
    if {[my exists trackedClasses]} {
        foreach class [my set trackedClasses] {
            if {[$class ismixin [self]]} {
                $class mixin delete [self]
            }
        }
    }
    my set trackedClasses {}
    namespace eval :: {
        rename proc {}
        rename procOld proc
    }
}
