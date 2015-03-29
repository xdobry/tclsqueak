IDE::DBVCUtils instproc testGVersionTreeMethod {} {
    my instvar compBrowser
    ${compBrowser}::appview setSelectedItem IDECore
    ${compBrowser}::classview setSelectedItem IDE::Component
    ${compBrowser}::methodcatview setSelectedItem _all_categories
    ${compBrowser}::methodview setSelectedItem addClass
    my invokeMenu Component {Version Control} {Version Tree}
    my closeWindowClass IDE::VersionTreeView
}
