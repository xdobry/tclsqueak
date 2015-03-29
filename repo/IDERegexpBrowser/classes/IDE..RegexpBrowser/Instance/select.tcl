IDE::RegexpBrowser instproc select level {
    my instvar data v_mode

    # update
    my go
    if {[llength $data(v:result)] == 0} {
        bell
        return
    }
    # puts regexp
    my dump
    # extract matching parts in sample
    set i 0
    set newsample ""
    foreach match $data(v:result) {
        if {($i % $data(v:nblevels)) == $level} {
            set text [$data(w:sample) get  [$data(w:sample) index "1.0+[lindex $match 0]chars"]  [$data(w:sample) index "1.0+[expr [lindex $match 1]+1]chars"]]
            append newsample $text
            if {$v_mode == "nl"} {
                append newsample "\n"
            }
        }
        incr i
    }
    $data(w:sample) delete 1.0 end
    $data(w:sample) insert 1.0 $newsample
    # update with regexp
    my go
}
