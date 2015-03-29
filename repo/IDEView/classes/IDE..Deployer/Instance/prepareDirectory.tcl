IDE::Deployer instproc prepareDirectory {} {
    my instvar targetDir old_dir
    if {![file isdirectory $targetDir]} {
        file mkdir $targetDir
    }
    set old_dir [pwd]
    cd $targetDir
}
