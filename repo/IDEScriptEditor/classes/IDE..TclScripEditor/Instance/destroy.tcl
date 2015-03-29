IDE::TclScripEditor instproc destroy {} {
    if {[lsearch [interp slaves] scriptslave]!=-1} {
       interp delete scriptslave
    }
    next
}
