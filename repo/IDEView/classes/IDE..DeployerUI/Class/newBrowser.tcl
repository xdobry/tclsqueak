IDE::DeployerUI proc newBrowser {{type directory} {components {}}} {
    # suported types: directory, kit, exe
    my instvar browser
    if {![info exists browser] || ![Object isobject $browser]} {
        set browser [my new [Object autoname .deployer] [list -type $type] [list -components $components]]
    } else {
        IDE::Dialog message "Deployer browser is already open"
    }
}
