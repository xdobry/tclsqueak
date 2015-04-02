IDE::RegexpBrowser instproc sample:load {} {
    my instvar data

    # get filename
    set types [list [list "All" *]]
    set file [tk_getOpenFile -initialdir $data(v:dir) -filetypes $types -parent .]
    if {$file == ""} {
        return
    }
    # memorize location
    set data(v:dir) [file dirname $file]
    set data(v:file) [file tail $file]
    # do it
    set in [open $file "r"]
    my sample:set [read $in [file size $file]]
    close $in
}
