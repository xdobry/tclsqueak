IDE::ComponentPersistence instproc getVersionNumber {} {
    my instvar versioninfo
    set v $versioninfo
    regsub -all {\[.*\]} $v {} v
    if {![regexp {[0-9]+[0-9.]*[0-9]+} $v v]} {
        IDE::Transcript warning "no version number in versioninfo [my getName]" 
        return [next]
    }
    return $v
}
