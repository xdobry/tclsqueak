IDEStarter proc loadConfigMapDevel {} {
    my instvar configmap configmapdb
    if {[my exists configmap]} {
        if {[my exists loaded]} {
            return
        }
        if {![file exists $configmap]} {
            error "can not find file $configmap"
            return 0
        }
        IDE::SystemConfigMap loadFromFile $configmap
        IDE::SystemConfigMap loadComponents
        IDEPreferences setParameter ignoreIDEComponents 1
    }
    if {[info exists configmapdb]} {
        if {[IDE::System isDatabase]} {
            IDE::SystemConfigMap loadComponentFromAny IDEConfiguration
            IDE::ConfigmapControler initConfigmaps
            IDE::ConfigmapControler instvar configmapArr
            if {[info exists configmapArr($configmapdb)]} {
                set maxid 0
                set maxcmap {}
                foreach cmap  $configmapArr($configmapdb) {
                    if {[$cmap set configmapid]>$maxid} {
                        set maxid [$cmap set configmapid]
                        set maxcmap $cmap
                    }
                }
                $maxcmap loadAndRun
            } else {
                puts "Configuration map $configmapdb not found in DB"
            }
        } else {
            puts "Can not load configuration map from DB. IDE started without version control."
        }
        IDEPreferences setParameter ignoreIDEComponents 1
    }
}
