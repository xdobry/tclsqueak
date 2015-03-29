IDE::Deployer instproc startScriptString compToSave {
    my instvar onefile nopackages nometa
    if {[IDE::SystemConfigMap exists preStartScript] && [IDE::SystemConfigMap set preStartScript] ne ""} {
        append script [IDE::SystemConfigMap set preStartScript] \n
    } else {
        append script [my startScriptInvocation]
    }
    if (!$onefile) {
        if {$nopackages} {
            foreach comp $compToSave {
                append script "source [$comp standardFileName]\n"
            }
        } else {
            foreach comp [IDE::SystemConfigMap set componentsToLoad] {
                append script "package require [lindex $comp 0]\n"
            }
        }
    } else {
        foreach comp $compToSave {
            append script [$comp asScript $nometa] \n
        }
    }
    if {[IDE::SystemConfigMap exists startScript]} {
        append script [IDE::SystemConfigMap set startScript] \n
    }
    return $script
}
