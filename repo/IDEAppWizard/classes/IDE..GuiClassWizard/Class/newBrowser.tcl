IDE::GuiClassWizard proc newBrowser {{selectedComponent {}}} {
    my new [Object autoname .uiclasswizard] [list -selectedComponent $selectedComponent]
}
