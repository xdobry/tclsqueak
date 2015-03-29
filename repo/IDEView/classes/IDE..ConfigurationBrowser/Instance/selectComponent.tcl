IDE::ConfigurationBrowser instproc selectComponent compItem {
    my instvar compVersionCash selectedCompItem
    if {![IDE::System isDatabase]} return
    set selectedCompItem $compItem
    set comp [lindex $compItem 0]

    if {![info exists compVersionCash($comp)]} {
        set compVersionCash($comp) [IDE::ComponentPersistence getVersionsForName $comp]
    }
    [self]::appversion setListUnsorted [concat automatic package $compVersionCash($comp)]
    set version [lindex $compItem 1]
    if {$version eq ""} {[self]::appversion setSelectedItem automatic 0; return}
    if {$version eq "package"} {[self]::appversion setSelectedItem package 0; return}
    set i 0
    foreach item $compVersionCash($comp) {
        if {$version==[lindex $item 0]} {
            [self]::appversion setSelectedIndex [expr {$i+2}] 0
            return
        }
        incr i
    }
}
