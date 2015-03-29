IDE::InstallerGUI instproc cleanInputGUI {} {
   [self] instvar win
   foreach child [winfo children $win.inputframe] {
       ::destroy $child
   }
}
