IDE::CompView instproc createNewComponent {component ootype namespace installInRepo} {
    IDE::Component createCompObjectForName $component $ootype $namespace
    IDE::System signalComponentsChanged
}
