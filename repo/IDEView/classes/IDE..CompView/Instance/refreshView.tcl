IDE::CompView instproc refreshView {} {
    my instvar vcomponent
    set v [my info parent]::methodedit
    $v setTextControler [[IDE::Component getCompObjectForNameIfExist $vcomponent] getComment] [self]
}
