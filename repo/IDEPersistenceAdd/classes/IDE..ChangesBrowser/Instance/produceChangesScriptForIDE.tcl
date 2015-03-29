IDE::ChangesBrowser instproc produceChangesScriptForIDE {} {
    my produceChangesScriptFor [concat [IDE::System getCoreComponentsAll] [IDE::System getExtraComponents]]
}
