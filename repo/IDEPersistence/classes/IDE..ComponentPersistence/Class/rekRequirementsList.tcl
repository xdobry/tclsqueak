IDE::ComponentPersistence proc rekRequirementsList {componentId componentList} {
    # return the list of pair {component_name componentId}
    # needed to load before load componentId
    # puts "read rek $componentId componentList"
    foreach {name version} $componentList {
        set componentArr($name) $version
    }
    set rList [my readRequiredForId $componentId]
    foreach comp $rList {
        set found 0
        foreach nameversion $componentList {
            if {[lindex $nameversion 0]==$comp} { set found 1; break }
        }
        if {!$found &&
        [IDE::Component getCompObjectForNameIfExist $comp] eq ""} {
            set version [my questIdForComponentName $comp]
            if {$version eq ""} {
                return _forgetit
            }
            if {$version ne "package"} {
                set componentList [my rekRequirementsList $version $componentList]
                lappend componentList [list $comp $version]
            }
        }
    }
    return $componentList
}
