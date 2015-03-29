POTHelper instproc nextMisspelledEspItem {} {
    my instvar catalog item
    set lng [lindex [split [::msgcat::mclocale] _ ] 0]
    set x $item
    set speller [HunspellTestilo prenuInstancoPorLingvo eo]
    if {$speller eq ""} {
        IDE::Dialog message "no speller for $lng"
        return
    }
    while {$x<[llength $catalog]} {
        incr x
        set original [lindex $catalog $x]
        set trans $original
        set vlist [regexp -all -inline {\m[[:alpha:]]{3,}\M} $trans]
        if {[llength $vlist]==0} continue
        set unknown [$speller testuVortoj $vlist]
        if {[llength $unknown]>0} {
            my setItem $x
            foreach v $unknown {
                [self]::original colorizeText $v
            }
            return
        }
    }
}
