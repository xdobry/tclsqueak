IDE::Toolbar proc addImageCreators creator {
    my instvar imageCreators
    if {![info exists imageCreators] || $creator ni $imageCreators} {
        lappend imageCreators $creator
    }
}
