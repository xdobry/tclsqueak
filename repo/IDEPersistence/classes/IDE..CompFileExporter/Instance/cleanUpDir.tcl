IDE::CompFileExporter instproc cleanUpDir {directory time} {
    set dirisused 0
    puts "cleanup $directory"
    foreach f [glob -directory $directory -nocomplain *] {
        if {[file isdirectory $f]} {
            if {![my cleanUpDir $f $time]} {
                # file delete $f
                puts "delete $f"
            } else {
                set dirisused 1
            }
        } else {
            if {[file mtime $f]<$time} {
                # file delete $f
                puts "delete file $f"
            } else {
                set dirisused 1
            }
        }
    }
    return $dirisused
}
