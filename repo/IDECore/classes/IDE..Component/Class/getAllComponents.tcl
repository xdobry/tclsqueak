IDE::Component proc getAllComponents {} {
    foreach {k e} [my array get components] {
        lappend compObjs $e
    }
    return $compObjs
}
