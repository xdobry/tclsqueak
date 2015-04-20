IDE::CompView instproc createNewComponent {component ootype namespace installInRepo} {
    IDE::Component getCompObjectForName $component $ootype
    IDE::System signalComponentsChanged
}
