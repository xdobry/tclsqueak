IDE::Deployer instproc actionGenerate {} {
    my instvar targetDir nometa onefile nopackages configName desc
    set compToSave [my getComponentsToDeploy]
    if {[llength $compToSave]==0} return

    my prepareDirectory

    if {!$onefile} {
        foreach cobj $compToSave {
            $cobj saveAsScript [file join $targetDir [$cobj standardFileName]] $nometa
        }
    }
    if {!$nopackages && !$onefile} {
        pkg_mkIndex -direct $targetDir *.xotcl
    }
    if {!$nopackages && !$onefile} {
        my writeScriptFile [file join $targetDir deployment.desc] $desc
    }
    my writeScriptFile [file join $targetDir [my getStartscriptName]] [my startScriptString $compToSave]

    my setFileAttributes
    my createSystemStartScript
    my postGenerate
}
