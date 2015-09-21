IDE::PreferencesDialog instproc getOptionsDescription {} {
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
        {Source Editor} {
            syntaxCheck {Syntax check on save} bool
            syntaxHightlight {{Type of syntax highlighting} {none} 0 {simple} 1 {syntax checker based} 2} options
            
        }
    }
    return $p
}
