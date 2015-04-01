ORATcl instproc disconnect {} {
   if {[my exists connected] && [my set connected]} {
        oralogoff [my set handle]
        my set connected 0
   }
}
