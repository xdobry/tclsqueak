IDE::SystemConfigMap proc checkRequirements compList {
     set outCompList {}
     set procList {}
     set cleanList [ide::lcollect each $compList {lindex $each 0}]

     foreach comp $compList {
         set cname [lindex $comp 0]
         if {$cname in $procList} continue
         set cobj [IDE::Component getCompObjectForNameIfExist $cname]
         if {$cobj ne ""} {
             set reqComps [$cobj getRequiredFromDeep]
             foreach sreq $reqComps {
                 if {$sreq ni $procList} {
                     set id [lsearch -exact $cleanList $sreq]
                     if {$id>=0} {
                         lappend outCompList [lindex $compList $id]
                     } else {
                         lappend outCompList $sreq
                     }
                     lappend procList $sreq
                 }
             }
         }
         lappend outCompList $comp
         lappend procList $cname
     }
    return $outCompList
}
