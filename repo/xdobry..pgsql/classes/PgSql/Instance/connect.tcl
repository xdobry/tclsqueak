PgSql instproc connect par_list {
    my instvar sqlhandle connected dbank user password hostname
    set conninfo {}
    array set par_array $par_list
    foreach par [array names par_array] {
        if {$par_array($par) ne ""} {
            if {$par eq "interface"} {
                continue
            }
            if {$par eq "dbname"} {
                set dbank $par_array($par)
            }
            my  instvar $par
            set $par $par_array($par)
            lappend conninfo "$par='$par_array($par)'"
        }
    }
    if {[catch {set sqlhandle [pg_connect -conninfo $conninfo]} err]!=0} {
        my errorMessage $err
        return 0
    }
    set connected 1
    return 1
}
