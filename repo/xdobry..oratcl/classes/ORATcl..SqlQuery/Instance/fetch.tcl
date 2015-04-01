ORATcl::SqlQuery instproc fetch {} {
   if {[orafetch [my qhandle] -datavariable row]==0} {
       return $row
   }
   return
}
