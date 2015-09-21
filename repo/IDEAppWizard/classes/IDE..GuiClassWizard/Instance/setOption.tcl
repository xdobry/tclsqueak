IDE::GuiClassWizard instproc setOption {name value} {
    my instvar defaultOptions
    dict set defaultOptions $name $value
}
