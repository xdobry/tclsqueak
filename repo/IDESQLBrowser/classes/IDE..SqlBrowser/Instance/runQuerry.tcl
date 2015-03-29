IDE::SqlBrowser instproc runQuerry {} {
    set command [[self]::@sqlquerry getText]
    if {$command eq ""} return
    if {![string match -nocase select* [string trim $command]]} {
        my executeCommand $command
        return
    }
    my instvar dbConnection win cellArr
    catch {unset cellArr}
    set query [$dbConnection query $command]
    if {$query eq ""} {
        [self]::@sqlresult setText [$dbConnection errorMessage]
        my clearTable
        my set resultshow text
        my changeResultShow
        return
    }
    my addToHistory $command
    set x 0
    set cols 0
    set returnedRows 0
    set hasLabels 0
    while 1 {
        set row [$query fetch]
        if {$row eq ""} break
        if {$cols==0} {
             set cols [llength $row]
             if {[$query info methods rows] ne ""} {
                 set rows [$query rows]
             } else {
                 set rows 30
             }
             if {[$query info methods columnNames] ne ""} {
                 incr rows
                 incr x
                 set hasLabels 1
                 $win.result.table configure -rows $rows -cols $cols
                 $win.result.table set row 0,0 [$query columnNames]
                 $win.result.table configure -titlerows 1
             } else {
                 $win.result.table configure -rows $rows -cols $cols
             }
        }
        set rrow [list]
        set cx 0
        foreach elem $row {
            if {[string bytelength $elem]>100} {
                lappend rrow "<[string bytelength $elem] bytes>"
                set cellArr($x,$cx) $elem
            } else {
                lappend rrow $elem
            }
            incr cx
        }
        $win.result.table set row $x,0 $rrow
        incr x
        incr returnedRows
        if {$returnedRows>=$rows+$hasLabels} {
            incr rows 20
            $win.result.table configure -rows $rows
        }
    }
    if {$returnedRows!=$rows+$hasLabels} {
         $win.result.table configure -rows [expr {$returnedRows+$hasLabels}]
    }
    if {$x==0} {
       my clearTable
    }
    my set resultshow table
    my changeResultShow
    [self]::@sqlresult setText "returned rows: $returnedRows"
    $query destroy
}
