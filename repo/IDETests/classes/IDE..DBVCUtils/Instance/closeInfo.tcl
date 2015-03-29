IDE::DBVCUtils instproc closeInfo {} {
    update idletasks
    set i [lindex [IDE::IDialogEntry info instances] 0]
    my assert {$i ne ""}
    my invokeButton Cancel $i 
    update idletasks
}
