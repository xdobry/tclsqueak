IDE::NSView instproc dumpToWorkspace ns {
    set t [IDE::Transcript newBrowser]
    $t @editor setText [[my getIntroProxy] dumpNamespace]
}
