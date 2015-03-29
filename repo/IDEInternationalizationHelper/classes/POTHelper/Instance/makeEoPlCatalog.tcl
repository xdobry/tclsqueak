POTHelper instproc makeEoPlCatalog {} {
    package require tdom
    my instvar cat_eo cat_pl
    set doc [dom createDocument tmx]
    set tmx [$doc documentElement]

    for {set sid [array startsearch cat_eo]} {[array anymore cat_eo $sid]} {} {
        set name [array nextelement cat_eo $sid]
        if {[info exists cat_pl($name)]} {
             set tu [$doc createElement tu]
             $tmx appendChild $tu
             set tuv [$doc createElement tuv]
             $tuv setAttribute xml:lang eo
             $tu appendChild $tuv
             set seg [$doc createElement seg]
             $tuv appendChild $seg
             $seg appendChild [$doc createTextNode $cat_eo($name)]

             set tuv [$doc createElement tuv]
             $tuv setAttribute xml:lang pl
             $tu appendChild $tuv
             set seg [$doc createElement seg]
             $tuv appendChild $seg
             $seg appendChild [$doc createTextNode $cat_pl($name)]

             set tuv [$doc createElement tuv]
             $tuv setAttribute xml:lang en
             $tu appendChild $tuv
             set seg [$doc createElement seg]
             $tuv appendChild $seg
             $seg appendChild [$doc createTextNode $name]
        }
    }
    array donesearch cat_eo $sid

    set of [open eopl.tmx w]
    fconfigure $of -encoding utf-8
    puts $of [[$doc documentElement] asXML]
    close $of
}
