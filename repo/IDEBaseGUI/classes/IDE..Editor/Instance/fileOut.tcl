IDE::Editor instproc fileOut {} {
    my instvar win fileName
    if {![info exists fileName]} {
        set fileName fileout.wrk
    }
    set filetypes {{{Work files} *.wrk} {{Tcl files} *.tcl} {{XOTcl files} *.xotcl} {{Text Files} *.txt} {{XML Files} .xml} {{All files} *}}
    set fname [IDE::Dialog getSaveFile $fileName $filetypes wrk]
    if {$fname eq ""} return
    set fileName $fname
    my saveFile $fileName
}
