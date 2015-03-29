IDE::Editor instproc fileIn {} {
    set fileName [IDE::Dialog getOpenFile {{{Tcl Files} *.tcl} {{XOTcl Files} *.xotcl} {Workspace *.wrk} {Text *.txt} {{All files} *}} ]
    my openFile $fileName
}
