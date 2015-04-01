IDE::WikiScriptsBrowser instproc configureProxy {} {
    my instvar proxyHost proxyPort configuredProxyHost configuredProxyPort

    if {$proxyHost ne "" && $proxyPort ne ""} {
        if {![info exists configuredProxyHost] || ![info exists configuredProxyPort] || $proxyHost ne $configuredProxyHost || $proxyPort != $configuredProxyPort} {
            http::config -proxyhost $proxyHost -proxyport $proxyPort
            set configuredProxyPort $proxyPort
            set configuredProxyHost $proxyHost
        }
    }
}
