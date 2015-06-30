IDE::Dialog proc getOpenFile {{fileTypes {{{All files} *}}} {initialDir {}}} {
    set fwin [focus]
    set parent .
    set olddir [pwd]
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    if {$initialDir ne ""} {
        set file [tk_getOpenFile -parent $parent -filetypes $fileTypes -initialdir $initialDir]
    } else {
        set file [tk_getOpenFile -parent $parent -filetypes $fileTypes]
    }
    cd $olddir
    return $file
}
