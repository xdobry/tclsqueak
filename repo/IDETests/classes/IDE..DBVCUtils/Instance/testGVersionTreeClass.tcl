IDE::DBVCUtils instproc testGVersionTreeClass {} {
    my instvar compBrowser
    $compBrowser refreshHItem {IDE::Component Def IDECore}
    my invokeMenu Class {Version Control} {Version Tree}
    my closeWindowClass IDE::VersionTreeView
}
