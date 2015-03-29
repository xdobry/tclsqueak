SignatureRepository instproc loadRepository file {
    set in [open $file r]
    set wholeLine ""
    while {[gets $in line]>=0} {
        append wholeLine $line \n
        if {[info complete $wholeLine]} {
            #ttc vartype wholeLine list
            set cmdName [lindex $wholeLine 0]
            if {$cmdName in {registerVariable registerObject registerMethod registerProc addNamespaceExport addNamespaceImport}} {
                if {[catch {my $cmdName {*}[lrange $wholeLine 1 end]} res]} {
                    puts "error by loading $cmdName [lrange $wholeLine 1 end]"
                    #error $res
                }
            }
            set wholeLine ""
        }
    }
    close $in
}
