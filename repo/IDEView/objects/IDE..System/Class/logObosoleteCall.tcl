IDE::System proc logObosoleteCall {} {
    set calllevel [expr {[info level]-1}]
    set method [info level $calllevel]
    set expr "!\[catch self\] && \[self proc\]==\"$method\""
    set isobject [uplevel #$calllevel [list expr $expr]]
    if {$isobject} {
        set object [uplevel #$calllevel {list [self]}]
        set class [uplevel #$calllevel {list [self class]}]
        if {[$object isclass] || $class eq "" || $class eq "{}"} {
            puts "obsolete method call: $object proc $method"
        } else {
            puts "obsolete method call: $class instproc $method"
       }
    } else {
        puts "obsolete proc call: $method"
    }
}
