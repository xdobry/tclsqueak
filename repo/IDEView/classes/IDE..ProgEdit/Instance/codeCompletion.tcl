IDE::ProgEdit instproc codeCompletion {{isTab 0}} {
    set twin [my getTextWindow]
    lassign [my getSelectedLines] sStart sEnd
    if {$sStart<$sEnd} {
        if {$isTab} {
            my addIndent
        }
        return 1
    }
    set insert [$twin index insert]
    set res [$twin get "$insert linestart" $insert]
    #puts "codecomp: $res"
    if {[my editMode] eq "xotcl" && [regexp {[\w\$]+} $res]} {
       # remove all before ; or \[
       regexp {[^\[;]+$} $res res
       if {[regexp {(.+)\s+(-\w*)$} $res _ cmdline uoption]} {
           my getOption $cmdline $uoption
       } elseif  {[regexp {([\w:\]]*)(?:\s+|^)([:\w]+)$} $res _ basecommand fchars]} {
           # commands has two tails. Try to complete second tails
           # puts "res '$res' #bas1 '$basecommand' #fc '$fchars'"
           if {$basecommand eq "my" || $basecommand eq "self\]"} {
               # invoke own local method per my or [self]
               my getInstanceCommand ${fchars}*
           } elseif {[Object isobject $basecommand]} {
               # invoke Object method direkt per object name
               my invokePopDown [$basecommand info procs ${fchars}*] ${fchars}*
           } elseif {[lsearch {set append lappend incr unset lset} $basecommand]>=0} {
               my getVariable $fchars
           } elseif {$basecommand ne "" && [llength [set subcommands [my getSubcommands $basecommand]]]>=0} {
               # complete subcommand as "array get" (get is subcommand)
               my getProcSubcommand $basecommand ${fchars}* $subcommands
           } elseif {![string match {$*} $fchars]} {
               my getBaseIdentifiers ${fchars}*
           }
       } elseif {[regexp {([\w:\]]+)\s+$} $res _ basecommand]} {
           if {$basecommand eq "my" || $basecommand eq "self\]"} {
               my getInstanceCommand *
           } elseif {[Object isobject $basecommand]} {
               my invokePopDown [$basecommand info procs] *
           } elseif {[llength [set subcommands [my getSubcommands $basecommand]]]>=0} {
               my getProcSubcommand $basecommand * $subcommands
           }
       }
       if {[regexp {\$([\w]*)$} $res _ basevariable]} {
           my getVariable $basevariable
       }
    } else {
       my appendToCursor {    }
    }
    return 1
}
