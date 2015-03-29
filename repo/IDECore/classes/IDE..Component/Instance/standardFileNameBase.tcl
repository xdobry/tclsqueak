IDE::Component instproc standardFileNameBase {} {
    set name [my getName]
    regsub -all :: $name _ name
    return $name
}
