IDE::TclKitDeployer instproc makeHeaderFile {} {
    my instvar targetDir starPackFile
    if {$starPackFile ne ""} {
        if {[file extension $targetDir] ne ".exe"} {
            append targetDir .exe
        }
        set header [my LoadHeader $starPackFile]
    } else {
        set header {#!/bin/sh
# %
exec @PROG@ "$0" ${1+"$@"}
package require starkit
starkit::header @TYPE@ @OPTS@
}
        append header \32
        regsub % $header \\ header

        set prog wish
        set ropts -readonly
        set type mk4
    
        regsub @PROG@ $header $prog header
        regsub @OPTS@ $header $ropts header
        regsub @TYPE@ $header $type header

        set n [string length $header]
        while {$n <= 240} {
            append header ################
            incr n 16
        }

        set slop [expr { 15 - (($n + 15) % 16) }]
        for {set i 0} {$i < $slop} {incr i} {
        append header #
        }
        set n [string length $header]
        if {$n % 16 != 0} {
            error "Header size is $n, should be a multiple of 16"
        }
    }
    my writefile $targetDir $header
}
