IDE::Editor instproc fileAppend {} {
    # append file to widget contents
    set file [IDE::Dialog getOpenFile {{{Tcl Files} *.tcl} {{XOTcl Files} *.xotcl} {Workspace *.wrk} {Text *.txt} {{All files} *}}]
    if {$file eq ""} return
    set fh [open $file r]
    my appendToCursor [read $fh]
    close $fh
}
