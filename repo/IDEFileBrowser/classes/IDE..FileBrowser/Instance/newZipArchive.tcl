IDE::FileBrowser instproc newZipArchive {} {
     set nf [IDE::IDialogEntry getValue "New Zip Archive Name"]
     if {$nf ne ""} {
         my instvar currentDic
         set fname [file join $currentDic $nf]
         if {[file exists $fname]} {
             IDE::Dialog error "file $nf already exists"
         } else {
             my newMount zip $fname $nf
         }
     }
}
