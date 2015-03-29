POTHelper instproc nextMisspelledItem {} {
    my instvar catalog item
    set lng [lindex [split [::msgcat::mclocale] _ ] 0]
    set x $item
    set speller [HunspellTestilo prenuInstancoPorLingvo $lng]
    if {$speller eq ""} {
        IDE::Dialog message "no speller for $lng"
        return
    }
    while {$x<[llength $catalog]} {
        incr x
        set original [lindex $catalog $x]
        if {[set trans [msgcat::mc $original]] ne $original} {
            set vlist [regexp -all -inline {\m[[:alpha:]]{3,}\M} $trans]
            if {[llength $vlist]==0} continue
            set unknown [$speller testuVortoj $vlist]
            if {[llength $unknown]>0} {
                my setItem $x
                foreach v $unknown {
                    [self]::translation colorizeText $v
                }
                return
            }
        }
    }
}
