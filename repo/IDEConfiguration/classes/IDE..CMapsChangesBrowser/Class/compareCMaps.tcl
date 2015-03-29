IDE::CMapsChangesBrowser proc compareCMaps {cmap1 cmap2} {
    set obj [my create [Object autoname browser] [Object autoname .browser] -mode components]
    $obj compareCMaps $cmap1 $cmap2
    return $obj
}
