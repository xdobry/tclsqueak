IDE::CompView instproc createNewComponent {component ootype namespace} {
    IDE::Component getCompObjectForName $component $ootype
    IDE::System signalComponentsChanged
}
