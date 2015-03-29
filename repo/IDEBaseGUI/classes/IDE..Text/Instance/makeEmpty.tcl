IDE::Text instproc makeEmpty {} {
    my instvar win state
    if {$state ne "empty"} {
        set state empty    
        $win.text delete 1.0 end
    }
}
