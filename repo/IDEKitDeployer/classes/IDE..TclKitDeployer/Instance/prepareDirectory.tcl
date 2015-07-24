IDE::TclKitDeployer instproc prepareDirectory {} {
    my instvar targetDir
    my makeHeaderFile
    vfs::mk4::Mount $targetDir $targetDir
}
