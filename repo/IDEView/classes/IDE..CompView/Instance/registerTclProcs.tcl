IDE::CompView instproc registerTclProcs {} {
    IDE::ImportMethodView startBrowserForComponent [IDE::Component getCompObjectForNameIfExist [my set vcomponent]]
}
