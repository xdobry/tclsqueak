IDE::Dialog proc getOpenFile {{fileTypes {{{All files} *}}}} {
    set fwin [focus]
    set parent .
    set olddir [pwd]
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    set file [tk_getOpenFile -parent $parent -filetypes $fileTypes]
    cd $olddir
    return $file
}
