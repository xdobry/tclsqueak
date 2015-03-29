IDE::DocGeneratorComponent instproc linkToObject obj {
    set name [string trimleft $obj :]
    if {[$obj getCompObject]==[[my componentObj] selfName]} {
        return "<a href=\"#class_$name\">$name</a>\n"
    } else {
        if {[ide::lcontain [[my mainObject] components] [$obj getComponentName]]} {
            return "<a href=\"[[my mainObject] fileNameForComponent [$obj getCompObject]]#class_$name\">$name</a>\n"
        }
    }
    return $name\n
}
