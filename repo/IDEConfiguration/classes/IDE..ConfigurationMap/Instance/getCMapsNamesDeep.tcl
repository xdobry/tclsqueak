IDE::ConfigurationMap instproc getCMapsNamesDeep {} {
    set names [ide::lcollect each [my getCMaps] {$each name}]]
    foreach c [my getCMaps] {
        set names [concat $names [$c getCMapsNamesDeep]]
    }
    return $names
}
