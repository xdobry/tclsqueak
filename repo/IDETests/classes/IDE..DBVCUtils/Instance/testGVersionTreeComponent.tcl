IDE::DBVCUtils instproc testGVersionTreeComponent {} {
    my instvar compBrowser
    ${compBrowser}::appview setSelectedItem IDECore
    my invokeMenu Component {Version Control} {Version Tree}
    my closeWindowClass IDE::VersionTreeView
}
