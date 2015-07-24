IDE::Deployer instproc getComponentsToDeploy {} {
    my instvar desc
    set compToSave [list]
    foreach comp [dict get $desc components] {
        set name [lindex $comp 0]
        set cobj [IDE::Component getCompObjectForNameIfExist $name]
        if {$cobj eq ""} {
            error "$comp is not currently loaded. You can only maka a distribution from loaded components. Operation canceled"
            cd [my set old_dir]
            return
        }
        lappend compToSave $cobj
    }
    return $compToSave
}
