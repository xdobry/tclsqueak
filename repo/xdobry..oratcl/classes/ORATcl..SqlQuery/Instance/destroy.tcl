ORATcl::SqlQuery instproc destroy {} {
   oraclose [my qhandle]
   next
}
