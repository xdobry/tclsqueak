IDE::DBVCUtils instproc testGVersionTreeComponent {} {
    my instvar compBrowser
    $compBrowser refreshHItem {IDE::Component Def IDECore}
    my invokeMenu Component {Version Control} {Version Tree}
    my closeWindowClass IDE::VersionTreeView
}
