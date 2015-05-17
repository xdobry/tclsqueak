IDE::ClassView instproc copyClass current {
    my instvar vcomponent
    set cobj [IDE::Component getCompObjectForNameIfExist $vcomponent]
    set newname [IDE::IDialogEntry getValue "Give Object/Class Copy Target Name"]
    if {$newname eq ""}  return
    if {[IDE::XOIntroProxy getIntroProxyForObject $newname] ne ""} {
        IDE::Dialog message "Object $newname already exists!"
        return
    }
    set targetComp [IDE::ComponentChooser chooseComponent "Select target Component" [$cobj getOOType] {}]
    if {$targetComp ne ""} {
        $cobj copyClassOrObject $current $newname $targetComp
        if {$targetComp eq $vcomponent} {
            my refreshList
        }
    }
}
