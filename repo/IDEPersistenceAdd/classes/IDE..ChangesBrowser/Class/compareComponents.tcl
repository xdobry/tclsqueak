IDE::ChangesBrowser proc compareComponents {comp1 comp2} {
    set obj [my create [Object autoname browser] [Object autoname .browser] -mode components]
    $obj compareComponents $comp1 $comp2
    return $obj
}
