IDE::ComponentPersistence proc initFromDB {columns values componentid} {
    set id [lsearch $columns name]
    if {$id<0} { error "wrong table descriptior" }
    set name [lindex $values $id]
    set id [lsearch $columns ootype]
    if {$id<0} { error "wrong tyble descriptor" }
    set ootype [lindex $values $id]
    set instance [IDE::Component getCompObjectForName $name $ootype]
    # !!! compute right version number
    package forget [$instance name]
    package provide [$instance name] 1
    $instance mixin add IDE::ComponentPersistence
    return $instance
}
