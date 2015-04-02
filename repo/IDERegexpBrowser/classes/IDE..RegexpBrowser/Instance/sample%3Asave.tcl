IDE::RegexpBrowser instproc sample:save mode {
    my instvar data

    # get filename
    set types [list [list "All" *]]
    set file [tk_getSaveFile -initialdir $data(v:dir) -initialfile $data(v:file)  -filetypes $types -parent .]
    if {$file == ""} {
        return
    }
    # memorize location
    set data(v:dir) [file dirname $file]
    set data(v:file) [file tail $file]
    # do it
    set out [open $file "w"]
    fconfigure $out -translation $mode
    puts $out [$data(w:sample) get 1.0 end]
    close $out
}
