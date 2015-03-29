IDE::RegexpBrowser instproc history:save {} {
    my instvar w_history
    set file [tk_getSaveFile -defaultextension .txt]
    if {$file != ""} {
        set out [open $file "w"]
        puts -nonewline $out [$w_history get 1.0 end]
        close $out
    }
}
