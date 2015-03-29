IDE::TPersistence instproc testFFaddMethod {} {
    my instvar compObj
    namespace eval :: {
         TestA instproc m3 {} {
             puts yee
         }
    }
    my assert {[[$compObj getObject TestA] getInstanceMethodIfExist m3] ne ""}
}
