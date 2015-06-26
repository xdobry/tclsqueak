PrsMarkupVisitor instproc generateBackReferences fileOut {
    my instvar currentDefs definitionsKey definitions globalRefsArr fileName
    $fileOut puts {<script class="include" type="text/javascript">
var tclHtmlBackRererences = [}
    set first 1
    set r 0
    foreach def $definitions {
        lassign $def d begin defFileName
        if {$defFileName eq $fileName} {
            if {![catch {set globalRefsArr($d)} brefs]} {
                if {!$first} {
                    $fileOut putsNonewline ,
                } else {
                    set first 0
                }
                $fileOut putsNonewline "\[\"r$r\",\["
                set rFirst 1
                foreach bref $brefs {
                    if {!$rFirst} {
                        $fileOut putsNonewline ,
                    } else {
                        set rFirst 0
                    }
                    if {[llength $bref]==1} {
                        set rdef [lindex $bref 0]
                        set rdefHumman [my methodDefToHuman $rdef]
                        set rr [lsearch $definitionsKey $rdef]
                        if {$rr<0} {
                            puts "definition not found $rdef"
                            continue
                        }
                        set linkSourceFileName [lindex $definitions $rr 2]
                        if {$linkSourceFileName eq $fileName} {
                            set rFileName ""
                        } else {
                            set rFileName [my fileToRelativeHtmlFile $fileOut $linkSourceFileName]
                            set rdefHumman "$linkSourceFileName: $rdefHumman"
                        }
                    } else {
                        lassign $bref rdef rFileName rr
                        set rdefHumman [my methodDefToHuman $rdef]
                        set rFileName [my fileToRelativeHtmlFile $fileOut $rFileName]
                    }
                    if {$rFileName eq ""} {
                        $fileOut putsNonewline "\[\"#r$rr\","
                    } else {
                        if {$rr ne ""} {
                            $fileOut putsNonewline "\[\"$rFileName#r$rr\","
                        } else {
                            $fileOut putsNonewline "\[\"$rFileName\","
                        }
                    }
                    $fileOut putsNonewline "\"$rdefHumman\"\]"
                }
                $fileOut putsNonewline "\]\]"
            }
        }
        incr r
    }
    $fileOut puts {];
        </script>
    }

}
