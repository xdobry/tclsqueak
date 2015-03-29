IDE::Dialog proc getSaveFile {initial {types {}} {defaultextension {}}} {
    set fwin [focus]
    set parent .
    if {$fwin ne ""} { set parent [winfo toplevel $fwin] }
    set olddir [pwd]
    if {[file dirname $initial] ne ""} {
        set idir [file dirname $initial]
    } else {
        set idir [pwd]
    }
    set file [tk_getSaveFile -initialdir $idir -initialfile [file tail $initial] -parent $parent -filetypes $types -defaultextension $defaultextension]
    cd $olddir
    return $file
}
