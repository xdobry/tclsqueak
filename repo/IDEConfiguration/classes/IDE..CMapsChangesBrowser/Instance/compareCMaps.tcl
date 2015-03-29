IDE::CMapsChangesBrowser instproc compareCMaps {tcmap1 tcmap2} {
    my instvar cmap1 cmap2 cmapArr1 cmapArr2
    set cmap1 $tcmap1
    set cmap2 $tcmap2
    $cmap1 setComponentsArray cmapArr1
    $cmap2 setComponentsArray cmapArr2
    [self]::components setList [my getDiffFromArrays cmapArr1 cmapArr2]
}
