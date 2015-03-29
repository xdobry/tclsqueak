IDE::TclModeEdit instproc setMarklineErrors {linesErrors lastLine} {
    my instvar errorLineWin errorRecIds
    set h [$errorLineWin cget -height]
    set twin [my getTextWindow]
    foreach {line index error} $linesErrors {
        set y [expr {$line*$h/$lastLine}]
        #puts "y=$y line=$line h=$h last=$lastLine"
        set id [$errorLineWin create rectangle 0 $y 10 [expr {$y+10}] -fill red]
        lappend errorRecIds $id
        $errorLineWin bind $id <ButtonPress-1> [list $twin see $index]
    }
}
