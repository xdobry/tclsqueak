IDE::ComponentPersistence proc synchronizeComponent comp {
    set cobj [IDE::Component getCompObjectForNameIfExist $comp]
    if {$cobj ne ""} {
        $cobj mixin add IDE::ComponentPersistence
        $cobj synchronizeWithDB
    } else {
        puts "component not fount $comp"
    }
}
