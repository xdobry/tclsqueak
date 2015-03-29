IDE::CompView instproc setAutoPath {} {
    global auto_path
    set ret [IDE::IDialogEntry getValue {Set auto_path global varible} $auto_path]
    if {$ret ne ""} {
        set auto_path $ret
    }
}
