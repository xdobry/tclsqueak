IDE::StructureBrowser proc inspectStructureVar {object var type {introProxy {}}} {
    if {$object ne "" && $introProxy eq ""} {
        set introProxy [IDE::XOIntroProxy getIntroProxyForObject $object]
    }
    if {$object ne "" && $introProxy ne ""} {
        if {[$introProxy getOOSystemName] eq "TclOO"} {
            set var [info object namespace $object]::$var
            set object ""
        }
    }
    set br [my create [Object autoname stbrowser] [Object autoname .stbrowser] -vobject $object -ovar $var -type $type -varray $var -introProxy $introProxy]
    return $br
}
