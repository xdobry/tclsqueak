IDE::SyntaxCheckMethodList instproc searchSenders actual {
    set method [lindex [split $actual >] 1]
    IDE::MethodBrowser searchSendersAll $method
}
