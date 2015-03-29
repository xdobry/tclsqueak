IDE::TExtDebugger instproc startTest {} {
   expr {[Object isobject IDE::ExtendedDebugger] && [info commands atk::halt] ne ""}
}
