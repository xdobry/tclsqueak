IDE::GuiClassWizard instproc getOption name {
    my instvar defaultOptions
    dict get $defaultOptions $name
}
