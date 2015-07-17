IDE::SyntaxCheckMethodList instproc searchSenders actual {
    lassign [IDE::XOIntroProxy getDescFromDisplayItem $actual] class type method
    IDE::MethodBrowser searchSendersAll $method
}
