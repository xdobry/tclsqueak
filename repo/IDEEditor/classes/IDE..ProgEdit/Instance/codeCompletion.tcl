IDE::ProgEdit instproc codeCompletion {{isTab 0}} {
    set twin [my getTextWindow]
    lassign [my getSelectedLines] sStart sEnd
    if {$sStart<$sEnd} {
        if {$isTab} {
            my addIndent
        }
        return 1
    }
    my instvar codeCompletion
    set insert [$twin index insert]
    set res [$twin get "$insert linestart" $insert]
    #puts "codecomp: $res"
    if {[my editMode] eq "xotcl" && [regexp {[\w\$]+} $res]} {
        set body [$twin get 1.0 end]
        set newlines [concat 0 [regexp -all -inline -indices \n $body]]
        lassign [split $insert .] line pos
        set cursor [expr {[lindex $newlines $line-1 0]+$pos+1}]
        string range $body 0 $cursor
        lassign [$codeCompletion getCompletionList $body $cursor [my getContentDescr]] entries pattern
        if {[llength $entries]>0} {
            my invokePopDown $entries $pattern
        }
    } else {
       my appendToCursor {    }
    }
    return 1
}
