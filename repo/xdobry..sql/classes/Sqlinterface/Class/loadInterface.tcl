Sqlinterface proc loadInterface name {
    foreach desc [my getInterfaces] {
        if {[lindex $desc 0] eq $name} {
            package require [lindex $desc 2]
            set iclass [lindex $desc 1]
            $iclass initializeInterface
            return $iclass
        }
    }
    error "no interface $name"
}
