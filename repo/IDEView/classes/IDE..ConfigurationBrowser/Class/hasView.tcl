IDE::ConfigurationBrowser proc hasView {} {
    expr  {[llength [my info instances]]!=0}
}
