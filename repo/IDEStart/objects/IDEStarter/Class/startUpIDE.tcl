IDEStarter proc startUpIDE {} {
    my closeWaitDialog
    catch {IDE::System loadIDEState}
    if {[llength [IDE::CompBrowser info instances]]==0} {
        IDE::CompBrowser newBrowser
    }
    IDE::Transcript buildMain
    my loadCaches
    ide::initOwnBGError
}
