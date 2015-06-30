IDE::ObjectBrowser instproc destroyActual {} {
    my instvar vobject type introProxy
    if {[IDE::Dialog yesNo "Do you want to destroy $vobject?"] ne "yes"} {  
        return
    }
    $vobject destroy
    if {$type eq "list"} { 
        [self]::objectsview removeItem $vobject
        my setViewObject "" $introProxy
    } else { 
        my destroy
    }
}
