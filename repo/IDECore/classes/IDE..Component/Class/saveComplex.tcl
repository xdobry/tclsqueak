IDE::Component proc saveComplex {comps nometa onefile target} {
    set ocomps [my orderComponents $comps]
    foreach comp $ocomps {
        set cobj [IDE::Component getCompObjectForNameIfExist $comp]
        if {$onefile} {
            append script [$cobj asScript $nometa 1]
        } else {
            $cobj saveAsScript [file join $target [$cobj standardFileName]] $nometa
        }
    }
    if {$onefile} {
        set of [open [file join $target components.xotcl] w]
        puts $of $script
        close $of
    }
}
