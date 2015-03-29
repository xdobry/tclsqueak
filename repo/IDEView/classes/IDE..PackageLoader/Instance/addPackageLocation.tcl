IDE::PackageLoader instproc addPackageLocation {} {
    set dir [IDE::Dialog getDir]
    if {[lsearch ::auto_path $dir]>=0} {
        IDE::Dialog message "$dir already in auto_load path\n$::auto_path"
        return
    }
    if {$dir ne ""} {
        lappend ::auto_path $dir
        my initPackages
    }
}
