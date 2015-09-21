IDE::OptionUIMix instproc selectDir nomo {
    my instvar opcioj
    set d [IDE::Dialog getDir $opcioj($nomo)]
    if {$d ne ""} {
        set opcioj($nomo) $d
    }
}
