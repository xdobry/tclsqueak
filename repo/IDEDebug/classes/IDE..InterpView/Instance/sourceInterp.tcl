IDE::InterpView instproc sourceInterp interp {
    set file [IDE::Dialog getOpenFile {{Tcl *.tcl} {XOTcl *.xotcl} {{All files} *}}]
    if {$file ne ""} {
        # TODO safe interp do not allow it
        interp eval $interp source [list $file]
    }
}
