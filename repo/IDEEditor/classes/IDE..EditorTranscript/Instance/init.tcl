IDE::EditorTranscript instproc init args {
    next
    my instvar toolbar scriptIndepend
    set scriptIndepend 0
    if {[info exists toolbar] && $toolbar ne ""} {
         $toolbar addCommand "Open File" [list [self] fileIn] open-task 1.0
         $toolbar addCommand "Save File" [list [self] fileSave] save_edit 1.1
         $toolbar addCommand "Find/Replace" [list IDE::FindReplace bindToView [self]] find 1.2
         $toolbar addSeparator 1.3
         $toolbar addCommand "Format" [list [self] autoIndent] sourceEditor 2.0
         $toolbar addCommand "Syntax Check" [list [self] syntaxCheck] syntax_check 2.1
         $toolbar addCheckbutton "Independend Script" {} [self]::scriptIndepend environment 2.2
    }
}
