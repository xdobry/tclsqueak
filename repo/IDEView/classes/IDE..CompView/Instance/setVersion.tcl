IDE::CompView instproc setVersion actual {
    set appObj [IDE::Component getCompObjectForName $actual]
    set ret [IDE::IDialogEntry getValue {Set the Version Number} [$appObj getVersionNumber]]
    if {$ret ne ""} {
        if {![catch {expr {$ret+0}}]} {
            $appObj setVersionNumber $ret
        } else {
            IDE::Dialog error "$ret is wrong version number"
        }
    }
}
