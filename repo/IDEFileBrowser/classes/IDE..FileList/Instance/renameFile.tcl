IDE::FileList instproc renameFile file {
    set dir [my getCurrent]
    set newname [IDE::IDialogEntry "new name"]
    if {$newname ne ""} {
        if {[file exists [file join $dir $newname]]} {
            IDE::Dialog error "file $newname already exists"
        } else {
            file rename [file join $dir $file] [file join $dir $newname] 
        }
    }
}
