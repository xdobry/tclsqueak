IDE::ConfigurationBrowser instproc editSave {text {contentDesc {}}} {
    IDE::SystemConfigMap setValueForType [my set vtype] $text
}
