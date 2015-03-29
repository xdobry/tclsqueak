IDE::ClassViewDB instproc selectItem object {
    next
    my instvar vclass cobj
    if {$object eq ""} return
    set desc [[$cobj getIntroProxy] getDescriptionForObject $vclass]
    if {$desc ne "" && [$desc isPersistent]} {
        [my info parent] setStatusBarText [$desc printString]
    } else {
        [my info parent] setStatusBarText "$object (object not in DB)"
    }
}
