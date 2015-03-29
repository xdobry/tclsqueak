IDE::SystemConfigMap proc saveConfigMapComponents {} {
    my instvar componentsToLoad
    if {![info exists componentsToLoad] || $componentsToLoad eq ""} {
        IDE::Dialog message "Nothing to save. Create components list first or load a configuration map file"
        return
    }
    set saveList {}
    foreach comp $componentsToLoad {
        set compName [lindex $comp 0]
        if {[IDE::Component getCompObjectForNameIfExist $compName] eq ""} {
            IDE::Dialog message "Component $compName can not be saved bacause it is not loaded into interpreter"
            return
        }
        lappend saveList $compName
    }
    IDE::Component saveComplex $saveList 0 0 [pwd]
    pkg_mkIndex -direct [pwd] *.xotcl
    IDE::Dialog message "Components $saveList was saved in acuall dictionary [pwd]. pkgIndex.tcl was updated in this dictionary"
}
