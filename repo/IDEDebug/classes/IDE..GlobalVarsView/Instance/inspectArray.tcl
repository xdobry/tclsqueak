IDE::GlobalVarsView instproc inspectArray actual {
    my instvar vtype
    if {$vtype ne "array"} {
        IDE::Dialog error "You must select an array"
        return
    }
    IDE::ArrayBrowser inspectGlobalArray $actual
}
