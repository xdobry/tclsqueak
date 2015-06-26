PrsMarkupVisitor instproc addGlobalRefs {elem ref} {
    my instvar globalRefsArr fileName definitionsKey definitions packageRefs
    if {[lindex $ref 0] eq "package"} {
        set packageName [lindex $ref 1]
        if {[catch {set packageRefs($fileName)} reqPackages]} {
            lappend packageRefs($fileName) $packageName
        } else {
            if {$packageName ni $reqPackages} {
                lappend packageRefs($fileName) $packageName
            }
        }
    }

    set r [lsearch $definitionsKey $ref]
    if {$r<0} {
        return
    }
    #puts "adding $ref - $r"
    set defElem $elem
    while {[Object isobject $defElem] && [$defElem hasclass PrsElement] && ![$defElem exists def]} {
        set defElem [$defElem info parent]
    }
    if {[Object isobject $defElem] && [$defElem exists def]} {
        set d [$defElem set def]
        # ignore if method definition of same object
        if {[lindex $ref 0] eq "object" && [lindex $d 0] eq "method" && [lindex $ref 1] eq [lindex $d 1 0]} {
            return
        }
        set bref [list $d]
    } else {
        # ignore if same file
        set linkSourceFileName [lindex $definitions $r 2]
        if {$linkSourceFileName eq $fileName} {
            return
        }
        set bref [list $fileName [my fileToHtmlFile $fileName]]
    }
    #puts "adding2 $bref to $ref"
    if {[catch {set globalRefsArr($ref)} brefs]} {
        set globalRefsArr($ref) [list $bref]
    } else {
        if {$bref ni $brefs} {
            lappend globalRefsArr($ref) $bref
        }
    }
}
