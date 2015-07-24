IDE::VarsView instproc inspectArray actual {
    my instvar vobject vtype
    if {$vtype ne "array"} {
        IDE::Dialog error "You must select an array"
        return
    }
    IDE::ArrayBrowser inspectArray $vobject $actual
}
