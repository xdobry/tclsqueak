IDE::Editor instproc fileIn {} {
    my instvar fileName
    set fileFilter {{{Tcl Files} *.tcl} {{XOTcl Files} *.xotcl} {Workspace *.wrk} {Text *.txt} {{All files} *}}
    set initialDir ""
    if {[info exists fileName]} {
         set dir [file dirname $fileName]
         if {$dir ne "" && [file isdirectory $dir]} {
             set initialDir $dir
             set ext [file extension $fileName]
             if {$ext ne ""} {
                 set found 0
                 foreach f $fileFilter {
                     if {[string match [lindex $f 0] $ext]} {
                         set found 1
                         break
                     }
                 }
                 if {!$found} {
                     set fileFilter [linsert $fileFilter 0 [list $ext *$ext]]
                 }
             }
         }
    }
    set newFile [IDE::Dialog getOpenFile $fileFilter $initialDir]
    if {$newFile ne ""} {
        set fileName $newFile
        my openFile $fileName
    }
}
