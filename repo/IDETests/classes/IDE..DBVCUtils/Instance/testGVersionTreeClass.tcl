IDE::DBVCUtils instproc testGVersionTreeClass {} {
    my instvar compBrowser
    $compBrowser refreshHItem {IDE::Component Def IDECore}
    my invokeMenu Class {Version Control} {Show Revision Graph}
    my closeWindowClass IDE::VersionTreeView
}
