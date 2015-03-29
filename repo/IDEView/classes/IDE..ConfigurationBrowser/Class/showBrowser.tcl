IDE::ConfigurationBrowser proc showBrowser {} {
    set first [lindex [my info instances] 0]
    if {$first eq ""} {
        my create confbrowser [Object autoname .browser]
    }
}
