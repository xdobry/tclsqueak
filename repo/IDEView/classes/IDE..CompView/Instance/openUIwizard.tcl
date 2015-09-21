IDE::CompView instproc openUIwizard {} {
    IDE::SystemConfigMap loadComponentFromAny IDEAppWizard
    IDE::GuiClassWizard newBrowser [my selectedItemFirst]
}
