IDE::PreferencesDialog instproc setOption {nomo valuo} {
    if {$nomo eq "textfont_pref"} {
        font configure textfont {*}$valuo
        IDEPreferences setParameter textfont [list -size [font configure textfont -size] -family [font configure textfont -family]]
        return
    }
    if {$nomo eq "listboxfont_pref"} {
        font configure listboxfont {*}$valuo
        IDEPreferences setParameter textfont [list -size [font configure listboxfont -size] -family [font configure listboxfont -family]]
        return
    }
    if {[string match *color $nomo]} {
        my instvar changedColor
        if {[info exists changedColor($nomo)]} {
            IDEPreferences setParameter $nomo $valuo
            if {$nomo eq "listboxcolor"} {
                IDE::ListView setColor $valuo
            } elseif {$nomo eq "textcolor"} {
                IDE::Text setColor $valuo
            }
        }
        return
    }
    IDEPreferences setParameter $nomo $valuo
}
