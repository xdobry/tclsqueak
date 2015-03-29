IDE::ConfigurationMap instproc saveAsPackages {} {
    set saveList {} 
    foreach compWrap [my getComponents] {
        if {![$compWrap isActualLoaded]} {
            if {[IDE::Dialog yesNo "[$compWrap name] is not acutall loaded and can be not save as package. Shoul the saving be continued without this component"] ne "yes"} return
        } else {
            lappend saveList [$compWrap name]
        }
    }
    if {$saveList ne ""} {
        IDE::Component saveComplex $saveList 0 0 [pwd]
        pkg_mkIndex -direct [pwd] *.xotcl
        IDE::Dialog message "Components $saveList was saved in acuall dictionary [pwd]. pkgIndex.tcl was updated in this dictionary"
    }
}
