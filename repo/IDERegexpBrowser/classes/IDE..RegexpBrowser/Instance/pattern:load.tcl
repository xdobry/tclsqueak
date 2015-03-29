IDE::RegexpBrowser instproc pattern:load {{file {}}} {
    my instvar data
    IDE::RegexpBrowser instvar regexp_db
    
    # get filename
    if {$file == ""} {
        set types [list [list "All" *]]
        set file [tk_getOpenFile -filetypes $types -parent .]
        if {$file == ""} {
            return
        }
    }
    # do it
    set in [open $file "r"]
    $data(w:menu) delete [expr 4+[llength $regexp_db]/2] end
    while {![eof $in]} {
        set name [gets $in]
        while {$name == ""} {
            set name [gets $in]
        }
        set pattern [gets $in]
        while {$pattern == ""} {
            set pattern [gets $in]
        }
        $data(w:menu) add command -label $name -command [list [self] regexp:insert [list $pattern]]
    }
    close $in
}
