IDE::GuiClassWizard instproc createUIClass {} {
    my instvar defaultOptions guiClassBuilder
    my acceptOptions
    $guiClassBuilder build $defaultOptions
    IDE::System signalComponentsChanged
    my destroy
}
