IDE::RegexpBrowser instproc regexp:load {} {
    my instvar data

    # get filename
    set types [list [list "All" *]]
    set file [tk_getOpenFile -filetypes $types -parent .]
    if {$file == ""} {
        return
    }
    # do it
    set in [open $file "r"]
    my regexp:set [read $in [file size $file]]
    close $in
}
