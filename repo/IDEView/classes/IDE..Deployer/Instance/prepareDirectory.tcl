IDE::Deployer instproc prepareDirectory {} {
    my instvar targetDir
    if {![file isdirectory $targetDir]} {
        file mkdir $targetDir
    }
}
