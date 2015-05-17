IDE::Toolbar proc convert {} {
    cd ~/icons-esperantilo
    set ret ""
    foreach f [glob *.png] {
        set rn [file rootname $f]
        exec convert -channel Opacity -threshold 40000 $f $rn.gif
        set b [exec base64 $rn.gif]
        set name $rn
        set Name [esp::grandskribi $name]
        append ret "IDE::Toolbar proc create$Name {} {
    image create photo $name -data {
        $b
    }
}
"
    }
    IDE::ResultBrowser newBrowser $ret
}
