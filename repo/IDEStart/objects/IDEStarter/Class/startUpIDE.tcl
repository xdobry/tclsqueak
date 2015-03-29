IDEStarter proc startUpIDE {} {
    my closeWaitDialog
    IDE::CompBrowser newBrowser
    IDE::Transcript buildMain
    my loadCaches
}
