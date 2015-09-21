IDE::OptionUIMix instproc changeColor nomo {
    my instvar opcioj win colorExample changedColor
    set c $opcioj($nomo)
    set ncolor [IDE::Dialog getColor $c]
    if {$ncolor ne ""} {
        set opcioj($nomo) $ncolor
        $colorExample($nomo) configure -background $ncolor
        set changedColor($nomo) 1
    }
}
