IDE::SystemConfigMap proc loadComponentsFromList loadList {
    if {$loadList eq ""} return
    foreach item $loadList {
        set name [lindex $item 0]; set type [lindex $item 1]
        if {$type eq "package"} {
            IDE::Component loadPackageIfNone $name
        } else {
            if {[Object isobject IDE::ComponentPersistence]} {
                IDE::ComponentPersistence loadNameVersionId $name $type {}
            } else {
                IDE::Component loadPackageIfNone $name
            }
        }
    }
    IDE::System signalComponentsChanged
}
