IDE::Deployer instproc actionGenerate {} {
    my instvar targetDir nometa onefile nopackages configName
    set compToSave [my getComponentsToDeploy]
    if {[llength $compToSave]==0} return

    my prepareDirectory

    if {!$onefile} {
        foreach cobj $compToSave {
            $cobj saveAsScript [$cobj standardFileName] $nometa
        }
    }
    if {!$nopackages && !$onefile} {
        pkg_mkIndex -direct [pwd] *.xotcl
    }
    if {!$nopackages && !$onefile} {
        my writeScriptFile [file rootname [file tail $configName]].cfmap [IDE::SystemConfigMap asScript]
    }
    my writeScriptFile [my getStartscriptName] [my startScriptString $compToSave]

    my setFileAttributes
    my postGenerate
    IDE::Dialog message "Distribution $configName is generated in $targetDir. Take a look at generated files. Check if all packages are saved. Copy another stuff (tcl-scripts, etc) in this directory."
    my destroy
}
