IDE::OptionUIMix instproc create_options {win name priskribo} {
    my instvar opcioj
    set opcioj($name) [my getOption $name]
    ttk::labelframe $win -text [lindex $priskribo 0]
    set index 0
    foreach {optname optvalue} [lrange $priskribo 1 end] {
        set rwin $win.r$index
        ttk::radiobutton $rwin -text $optname -variable [self]::opcioj($name) -value $optvalue
        pack $rwin -anchor w
        incr index
    }
}
