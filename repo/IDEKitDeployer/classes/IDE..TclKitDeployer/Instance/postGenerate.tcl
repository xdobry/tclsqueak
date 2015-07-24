IDE::TclKitDeployer instproc postGenerate {} {
    my instvar targetDir old_dir isXOTclcode cleanXOTcl desc
    # copy binary xotcl package to vsf from own location
    if {$isXOTclcode} {
        set foundNx 0
        foreach p $::auto_path {
            foreach d [glob -directory $p -nocomplain -types d nsf*] {
                file copy -force -- $d ${targetDir}/lib
                set foundNx 1
                break
            }
            if {$foundNx} {
                break
            }
        }
        if {!$foundNx} {
            foreach p $::auto_path {
                foreach d [glob -directory $p -nocomplain -types d xotcl*] {
                    file copy -force -- $d ${targetDir}/lib
                    set foundNx 1
                    break
                }
                if {$foundNx} {
                    break
                }
            }
        }
    }
    vfs::unmount $targetDir
    # if starpack and non windows set file execution attribute
    if {[dict exists $desc kitexe] && ![IDE::System isWindowsPlatform]} {
        file attributes $targetDir -permission rwxr--r--
    }
}
