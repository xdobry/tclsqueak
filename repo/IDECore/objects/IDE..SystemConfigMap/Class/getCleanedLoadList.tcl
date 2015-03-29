IDE::SystemConfigMap proc getCleanedLoadList {components {ignoreLoaded 1}} {
    my instvar dbAvailable packageAvailable
    # dbAvailable will be puffered
    if {[Object isobject IDE::ComponentPersistence]} {
        my set dbAvailable [IDE::ComponentPersistence getAvailable]
    } else {
        my set dbAvailable {}
    }
    set cloaded [IDE::Component getComponentNames]
    set loadList {}
    set tclpackages [package names]
    foreach comp $components {
        if {$ignoreLoaded && [IDE::Component getCompObjectForNameIfExist [lindex $comp 0]] ne ""} continue
       if {[llength $comp]==1} {
           if {[ide::lcontain $dbAvailable $comp]} {
               set versionList [IDE::ComponentPersistence getVersionsForName $comp]
               lappend loadList [list $comp [lindex [lindex $versionList 0] 0]]
           } elseif {[ide::lcontain $tclpackages $comp]} {
               lappend loadList [list $comp package]
           } elseif {![ide::lcontain $cloaded $comp]} {
               IDE::Dialog message "Component $comp can not be found in Database or as tcl package. Operation canceled"
               return
           }
       } else {
           set name [lindex $comp 0]; set type [lindex $comp 1]
           if {$type eq "package"} {
               if {![ide::lcontain $tclpackages $name]} {
                   IDE::Dialog message "Component $comp can not be found as tcl package. Operation canceled"
               }
               lappend loadList $comp
           } else {
               set versionList [IDE::ComponentPersistence getVersionsForName $name]
               if {[llength $versionList]==0} {
                   IDE::Dialog message "Component $comp can not be found in Database. Operation canceled"
               }
               if {$type eq "newest"} {
                   lappend loadList [list $name [lindex [lindex $versionList end] 0]]
               } else {
                   set versionList [ide::lcollect each $versionList {lindex $each 0}]
                   if {![ide::lcontain $versionList $type]} {
                       IDE::Dialog message "Component $comp Version $type can not be found in Database. Operation canceled"
                   }
                   lappend loadList [list $name $type]
               }
           }
       }
    }
    return $loadList
}
