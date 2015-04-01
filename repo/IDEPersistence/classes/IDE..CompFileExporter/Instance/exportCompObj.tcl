IDE::CompFileExporter instproc exportCompObj {cobj directory {withCleanUp 0}} {
    if {![file isdirectory $directory]} {
        error "is not directory $directory"
    }
    if {![$cobj isPersistent]} {
        error "component is not peristent"
    }
    if {$withCleanUp} {
        set time [clock seconds]
    }
    set compDir [file join $directory [my getFileName [$cobj getName]]]
    file mkdir $compDir
    my writeFileDataIfContent $compDir [$cobj getName].tcl [$cobj getPreScript]
    my writeFileDataIfContent $compDir [$cobj getName].txt [$cobj getComment]
    set classes [$cobj getClasses]
    my exportObjList $classes classes $cobj $compDir
    set deflist [$cobj getObjectDefineList]
    if {[llength $deflist]>0} {
        my writeFileData [file join $compDir classes] deforder.repo [join $deflist \n]
    }
    my exportObjList [$cobj getObjects] objects $cobj $compDir
    my exportObjList [$cobj getProcsGroupsObjects] procs $cobj $compDir
    my writeFileData $compDir version.info [$cobj getVersionNumber]
    set reqlist [concat [$cobj getRequiredFrom] [$cobj getSystemRequirements]]
    if {[llength $reqlist]>0} {
        my writeFileData $compDir require.list [join $reqlist \n]
    }
    my writeFileDataIfContent $compDir [$cobj getName].init [$cobj getInitScript]
    if {$withCleanUp} {
        incr time -30
        my cleanUpDir $compDir $time
    }
}
