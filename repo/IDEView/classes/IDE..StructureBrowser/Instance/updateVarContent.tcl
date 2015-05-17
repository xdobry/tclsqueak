IDE::StructureBrowser instproc updateVarContent {} {
    my instvar vobject ovar type content
    if {$vobject ne ""} {
        $vobject set $ovar $content
    } else {
        set $ovar $content
    }
}
