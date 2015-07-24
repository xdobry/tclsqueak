IDE::DeployerUI instproc browseKitExe {} {
    my instvar kitexe win
    set parent .
    set olddir [pwd]
    set parent [winfo toplevel $win]
    if {[IDE::System isWindowsPlatform]} {
        set fileTypes {{{executable} *.exe}}
    } else {
        set fileTypes {{{All} *}}
    }
    if {$kitexe ne ""} {
        set newoutput [tk_getOpenFile -parent $parent -filetypes $fileTypes -initialfile $kitexe]
    } else {
        set newoutput [tk_getOpenFile -parent $parent -filetypes $fileTypes]
    }
    cd $olddir
    if {$newoutput ne ""}  {
        set kitexe $newoutput
    }
}
