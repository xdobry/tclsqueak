IDE::DeployerUI instproc initComponents {} {
    my instvar win components checked
    set allcomps [lsort [[IDE::XOIntroProxy getIntroProxy] getUserRelevantComponents]]
    set twin $win.cframe.text
    set cnum 0
    foreach c $allcomps {
        if {$cnum>0} {
            $twin insert end \n
        }
        if {$c in $components} {
            set checked($c) 1
        } else {
            set checked($c) 0
        }
        set cwin [ttk::checkbutton $twin.c$cnum -variable [self]::checked($c) -text $c]
        $twin window create end -window $cwin
        incr cnum
    }
}
