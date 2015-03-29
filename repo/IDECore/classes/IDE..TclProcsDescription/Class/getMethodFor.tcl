IDE::TclProcsDescription proc getMethodFor method {
    my instvar methodArr
    if {![catch {set methodArr($method)} pobj]} {
        return $pobj
    }
    return
}
