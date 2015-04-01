ODBC instproc getSequenceFromDB {table count} {
    set try 0
    # Use optimistic strategy for incrementic sequencer
    # by using only 2 sql queries
    while 1 {
        set userkey [expr {round(rand()*32769)}]
        my execute "update Mysequence set lastid=lastid+$count,userkey=$userkey where name='$table'"
        set res [lindex [my queryList "select lastid,userkey from Mysequence where name='$table'"] 0]
        set id [lindex $res 0]
        set ruserkey [lindex $res 1]
        if {$userkey==$ruserkey} break
        incr try
        if {$try>10} {error "can not get sequence from db"}
        # Wait up to 3 secounds
        after [expr {round(rand()*3000)}]
   }
   return [expr {$id - $count + 1}]
}
