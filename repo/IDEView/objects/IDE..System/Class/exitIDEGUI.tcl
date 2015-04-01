IDE::System proc exitIDEGUI {} {
    if {[IDE::Dialog yesNo {Do you want to exit TclSqueak?}]} {
         catch {IDEStarter saveCaches}
         exit
    }
}
