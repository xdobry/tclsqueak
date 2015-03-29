IDE::ChangesBrowser proc compareObjects {obj1 obj2} {
    set obj [my create [Object autoname browser] [Object autoname .browser] -mode objects]
    $obj compareObjects $obj1 $obj2
    return $obj
}
