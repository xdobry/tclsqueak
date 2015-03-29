IDE::ConfigurationBrowser instproc fillMenuStruct aMenuStruct {
    $aMenuStruct enablementHandler [self]
    $aMenuStruct addCommand {Load Configuration Map} [list [self] loadFromFile]
    $aMenuStruct addCommand3 {Save Configuration Map as} [list [self] saveAsFile {}] hasComponents
    $aMenuStruct addCommand {Drop Comp List Changes} [list [self] initCompList]
    $aMenuStruct addCommand {Add Unmanaged Package} [list [self] addUnmanagedPackage]
    $aMenuStruct addSeparator
    $aMenuStruct addCommand3 {Deploy as File-Collection} [list [self] saveDistribution] hasComponents
    $aMenuStruct addCommand3 {Deploy as Tclkit} [list [self] saveAsTclkit] hasComponents
    $aMenuStruct addSeparator
    $aMenuStruct addCommand {Init from System} [list [self] initFromSystem]
    $aMenuStruct addCommand3 {Load Components} [list [self] loadComponents] hasComponents
    $aMenuStruct addCommand3 {Save ConfigMap Components} [list IDE::SystemConfigMap saveConfigMapComponents] hasComponents
    $aMenuStruct addSeparator
    $aMenuStruct addCommand3 {Run Start Scripts} [list IDE::SystemConfigMap startScripts] hasComponents
}
