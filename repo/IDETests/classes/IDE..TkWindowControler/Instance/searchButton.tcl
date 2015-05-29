IDE::TkWindowControler instproc searchButton {win name} {
    foreach c [winfo children $win] {
        if {[winfo class $c] in {Button TButton} && [$c cget -text]==$name} {
            return $c
        }
        set res [my searchButton $c $name]
        if {$res ne ""} {return $res}
    }
    return
}
