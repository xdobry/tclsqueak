IDE::Deployer instproc startScriptInvocation compToSave {
    my instvar onefile nopackages isXOTclcode
    if {[IDE::System isWindowsPlatform]} {
        set tclinterp /usr/local/bin/tcl
    } else {
        set tclinterp [file nativename [file normalize [info nameofexecutable]]]
    }
    set script "#!$tclinterp\n"
    append script "# File generated by tclsqueak deployment\n"

    set initialized [list]
    foreach comp $compToSave {
        foreach s [$comp getSystemRequirements] {
            if {$s ni $initialized} {
                append script "package require " $s \n
                if {$s eq "XOTcl"} {
                    append script "namespace import xotcl::* \n"
                    set isXOTclcode 1
                }
                lappend initialized $s
            }
        }
    }

    append script {# we set variable progdir to script location
set sname [info script]
if {$sname eq ""} {
    # Run interactive for develop purposes
    set progdir [pwd]
} else {
    file lstat $sname stats
    # follow sym links
    if {$stats(type) eq "link"} {
        set sname [file readlink $sname]
        if {[file pathtype $sname] eq "relative"} {
            set sname [file join [file dirname [info script]] $sname]
        }
    }
    set progdir [file dirname $sname]
}
}
   if {!$nopackages && !$onefile} {
      append script {lappend auto_path [file dirname $progdir]} \n
   }
   return $script
}
