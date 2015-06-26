Tcl2HTML instproc getPathTruncateFile file {
    my instvar pathTruncateCount
    file join {*}[lrange [file split $file] $pathTruncateCount end]
}
