IDE::DBVCUtils instproc testGVersionTreeClass {} {
    my instvar compBrowser
    ${compBrowser}::appview setSelectedItem IDECore
    ${compBrowser}::classview setSelectedItem IDE::Component
    my invokeMenu Class {Version Control} {Version Tree}
    my closeWindowClass IDE::VersionTreeView
}
