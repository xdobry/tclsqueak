IDE::FileList instproc showProperties file {
    set dir [my getCurrent]
    set fname [file join $dir $file]
    IDE::Dialog message "name: $file\ntype: [file type $fname]\nsize: [file size $fname]\ntime: [clock format [file mtime $fname]]"
}
