ODBC instproc disconnect {} {
   if {[my exists connected] && [my set connected]} {
        [my set handle] disconnect
        my set connected 0
   }
}
