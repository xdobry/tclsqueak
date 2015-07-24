IDE::Deployer instproc createSystemStartScript {} {
    my instvar targetDir configName
    if {[IDE::System isWindowsPlatform]} {
        set commandScriptExtension bat
        set tclinterp [file nativename [file normalize [info nameofexecutable]]]
        if {[string first " " $tclinterp]>0} {
            set tclinterp "\"$tclinterp\""
        }
        set script "$tclinterp \"%~dp0$configName\" %*"
        set startScriptFile [file join $targetDir [file rootname $configName].$commandScriptExtension]
        my writeScriptFile $startScriptFile $script
    } else {
        set commandScriptExtension sh
    }
    
}
