IDE::ClassDescription instproc getMethodId name {
    set mobj [my getInstanceMethodIfExist $name]
    if {$mobj eq ""} { 
        next
    } else {
        return [$mobj set methodid]
    }
}
