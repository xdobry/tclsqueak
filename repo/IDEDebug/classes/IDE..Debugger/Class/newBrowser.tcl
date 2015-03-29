IDE::Debugger proc newBrowser {} {
    set inst [my new [Object autoname .debuger]]
    $inst startBrowsing
    $inst destroy
}
