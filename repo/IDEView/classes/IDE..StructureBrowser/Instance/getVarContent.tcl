IDE::StructureBrowser instproc getVarContent {} {
    my instvar vobject ovar
    if {$vobject ne ""} {
        $vobject set $ovar
    } else {
        set $ovar
    }
}
