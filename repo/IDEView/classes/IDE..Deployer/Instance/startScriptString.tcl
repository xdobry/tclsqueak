IDE::Deployer instproc startScriptString compToSave {
    my instvar onefile nopackages nometa desc
    set script [my startScriptInvocation $compToSave]
    if (!$onefile) {
        if {$nopackages} {
            foreach comp $compToSave {
                append script "source [$comp standardFileName]\n"
            }
        } else {
            foreach comp $compToSave {
                append script "package require [$comp getName]\n"
            }
        }
    } else {
        foreach comp $compToSave {
            append script [$comp asScript $nometa] \n
        }
    }
    if {[dict exists $desc startScript]} {
        append script [dict get $desc startScript] \n
    }
    return $script
}
