IDE::ClassView instproc copyClass actual {
    my instvar vcomponent
    set cobj [IDE::Component getCompObjectForNameIfExist $vcomponent]
    set newname [IDE::IDialogEntry getValue "Give Object/Class Copy Target Name"]
    if {$newname eq ""}  return
    if {[Object isobject $newname]} {
        IDE::Dialog message "Object $newname already exists!"
        return
    }
    set targetComp [IDE::IDialogList getListItem "Select target Component" [lsort [IDE::Component getComponentNames]]]
    if {$targetComp eq ""} return
    $cobj copyClassOrObject $actual $newname $targetComp
}
