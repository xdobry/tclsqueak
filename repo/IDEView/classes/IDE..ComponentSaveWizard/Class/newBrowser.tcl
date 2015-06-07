IDE::ComponentSaveWizard proc newBrowser {{type package}} {
    return [my new [Object autoname .cswbrowser] -type $type]
}
