IDE::TclKitDeployer instproc postGenerate {} {
    my instvar targetDir old_dir isXOTclcode cleanXOTcl starPackFile
    if {$isXOTclcode && [info exists ::starkit::topdir]} {
        global ::starkit::topdir
        file mkdir ${targetDir}/lib
        file copy -force -- ${::starkit::topdir}/lib/xotcl1.3.4 ${targetDir}/lib
        if {$cleanXOTcl} {
            file delete -force -- ${targetDir}/lib/xotcl1.3.4/lib ${targetDir}/lib/xotcl1.3.4/xml ${targetDir}/lib/xotcl1.3.4/registry
        }
    }
    vfs::unmount $targetDir
    cd $old_dir
    # if starpack and non windows set file execution attribute
    if {$starPackFile ne "" && ![IDE::System isWindowsPlatform]} {
        file attributes $targetDir -permission rwxr--r--
    }
}
