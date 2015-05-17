IDE::PreferencesDialog instproc prenuPriskribo {} {
    set p {
        Core {
            startDefault {Start XOTcl with defauft parameters} bool
            ignoreIDEComponents {Ignore IDE Components} bool
        }
        Appearance {
            textfont_pref {Editor font} font
            listboxfont_pref {Listbox font} font
            textcolor {Editor color} color
            listboxcolor  {Listbox color} color
        }
        Connectivity {
            httpProxy {http Proxy} string
            httpProxyPort {http Proxy Port} string
        }
    }
    return $p
}
