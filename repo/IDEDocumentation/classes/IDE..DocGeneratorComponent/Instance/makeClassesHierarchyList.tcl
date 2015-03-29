IDE::DocGeneratorComponent instproc makeClassesHierarchyList classes {
   set text "<li>[my localLinkToObject [lindex $classes 0]]</li>"
   set i 0
   foreach subtree [lrange $classes 1 end] {
       if {!$i} {
           append text "<ul>\n"
           set i 1
       }
       append text [my makeClassesHierarchyList $subtree]
   }
   if {$i} { append text "</ul>\n" }
   return $text
   
   
}
