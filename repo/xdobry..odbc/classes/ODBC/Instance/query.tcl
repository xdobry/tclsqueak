ODBC instproc query statement {
    my instvar handle
    if {0} { 
	    set qname [Object autoname odbcquery]
	    $handle statement $qname $statement
	    $qname execute
	    puts "executed $statement"
	    return [ODBC::SqlQuery new  -qhandle $qname]
    } else {
          set data [my queryList $statement]
          if {$data ne ""} {
              return [ODBC::SqlQueryPuffer new [list -data $data] [list -position 0]]
          } else {
              return [ODBC::SqlQueryPuffer new [list -position -1]]
          }
    }
}
