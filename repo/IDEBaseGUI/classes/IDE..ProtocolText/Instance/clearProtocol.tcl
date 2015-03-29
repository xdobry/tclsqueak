IDE::ProtocolText instproc clearProtocol {} {
    my instvar odd protokolOn count itemLines state
    set odd 0
    set count 0
    set itemLines {}
    set state full
    my makeEmpty
}
