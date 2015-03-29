IDE::TclKitDeployer instproc prepareDirectory {} {
    my instvar targetDir old_dir
    
    my makeHeaderFile
    set old_dir [pwd]
    vfs::mk4::Mount $targetDir $targetDir
    catch {cd $targetDir}
    cd $targetDir
}
