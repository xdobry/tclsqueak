IDE::CompView instproc unloadComponent actual {
    set reqComp [IDE::System getCoreComponentsAll]
    if {$actual in $reqComp} {
        IDE::Dialog message "You can not unload this IDE-System Component [list $reqComp]"
        return
    }
    set appObj [IDE::Component getCompObjectForName $actual]
    set reqFor [$appObj getRequiredFor]
    if {[llength $reqFor]>0} {
        IDE::Dialog message "You can not unload $actual. It is required from $reqFor"
        return
    }
    $appObj unload
    [my info parent]::classview selectFor {}
    IDE::System signalComponentsChanged
}
