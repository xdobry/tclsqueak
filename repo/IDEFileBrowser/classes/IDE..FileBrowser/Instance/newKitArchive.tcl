IDE::FileBrowser instproc newKitArchive {} {
     set nf [IDE::IDialogEntry getValue "New Kit Archive Name (mk4 vfs)"]
     if {$nf ne ""} {
         my instvar currentDic
         if {[file exists [file join $currentDic $nf]]} {
             IDE::Dialog error "file $nf already exists"
         } else {
             my newMount mk4 [file join $currentDic $nf] $nf
         }
     }
}
