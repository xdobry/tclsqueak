IDE::ConfigmapBrowser proc newBrowser {} {
    if {[Object isobject cmbrowser]} {return cmbrowser}
    set inst [my create cmbrowser [Object autoname .browser]]
    IDE::ConfigmapControler setView $inst
    return $inst
}
