IDE::DBVCUtils instproc testGVersionTreeMethod {} {
    my instvar compBrowser
    $compBrowser refreshHItem {IDE::Component Instance addClass}
    my invokeMenu Component {Version Control} {Version Tree}
    my closeWindowClass IDE::VersionTreeView
}
