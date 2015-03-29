IDE::ConfigurationMap instproc importFromMap {} {
    if {![IDE::SystemConfigMap loadFromFile]} {return 0}
    set clist [IDE::SystemConfigMap getComponentsList 0]
    if {$clist eq ""} {return 0}
    set llist [ide::lcollect each [my getComponents] {$each getName}]
    set imported {}
    foreach celem $clist {
        set name [lindex $celem 0]
        set id [lindex $celem 1]
        if {[ide::lcontain $llist $name]} continue
        if {$id eq "package"} {
            IDE::Transcript warning "can not import $name as package into configuration"
            continue
        }
        set imp [IDE::ComponentConfWrapper::descriptor createInstanceFromDB IDE::ComponentConfWrapper $id]
        if {$imp ne ""} {
            lappend imported $imp
        } else {
            error "cound not import $name $id"
        }
    }
    if {$imported eq ""} {return 0}
    my setComponents [concat [my getComponents] $imported]
    set ips [IDE::SystemConfigMap getValueForType preStartScript]
    set ipos [IDE::SystemConfigMap getValueForType startScript]
    if {$ips ne ""} {
        my prescript $ips
        my updateAttributes prescript
    }
    if {$ipos ne ""} {
        my postscript $ipos
        my updateAttributes postscript
    }
    
    return 1
}
