IDE::CompView instproc changeWorkingDir {} {
    set newdir [IDE::Dialog getDir [pwd]]
    if {$newdir ne ""} {
        cd $newdir
    }
}
