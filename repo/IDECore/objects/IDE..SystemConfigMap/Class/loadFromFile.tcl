IDE::SystemConfigMap proc loadFromFile {{file {}}} {
    my instvar configName fileName
    if {$file eq ""} {
        set file [IDE::Dialog getOpenFile {{ConfigMap .cfmap}}]
    }
    if {$file eq ""} {return 0}
    source $file
    foreach list {preStartScript startScript componentsToLoad} {
        if {[info exists $list]} {
            my set $list [::set $list]
        }
    }
    set fileName $file
    set configName [file rootname [file tail $file]]
    return 1
}
