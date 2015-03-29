IDE::System proc exitIDEGUI {} {
    if {[IDE::Dialog yesNo {Do you want to exit XOTclIDE?}]} {
         catch {IDEStarter saveCaches}
         exit
    }
}
