IDE::VarsView instproc inspectAsDict actual {
    my instvar vobject vtype introProxy
    if {$vtype eq "array"} {
        IDE::Dialog error "You must not select an array"
        return
    }
    IDE::StructureBrowser inspectStructureVar $vobject $actual dict $introProxy
}
