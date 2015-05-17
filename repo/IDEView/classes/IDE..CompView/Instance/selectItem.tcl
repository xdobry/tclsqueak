IDE::CompView instproc selectItem item {
    my instvar vcomponent
    set vcomponent $item
    if {[Object isobject [my info parent]::classview]} {
        [my info parent]::classview selectFor $item
    }
    my refreshView
    set cobj [IDE::Component getCompObjectForNameIfExist $item]
    if {$cobj ne "" && [set ns [$cobj getNamespace]] ne ""} {
        [my info parent] setTitleAddition "$item ($ns)"
    } else {
        [my info parent] setTitleAddition $item
    }
}
