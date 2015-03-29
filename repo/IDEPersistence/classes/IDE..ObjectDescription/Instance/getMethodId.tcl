IDE::ObjectDescription instproc getMethodId name {
    set mobj [my getClassMethodIfExist $name]
    if {$mobj eq ""} return
    return [$mobj set methodid]
}
