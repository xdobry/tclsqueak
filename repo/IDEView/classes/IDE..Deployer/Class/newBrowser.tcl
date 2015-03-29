IDE::Deployer proc newBrowser {} {
    my instvar browser
    if {![info exists browser] || ![Object isobject $browser]} {
        set browser [my new [Object autoname .deployer]]
    } else {
        IDE::Dialog message "Deployer browser is already open"
    }
}
