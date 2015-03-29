IDE::WikiReapMixin instproc getScriptList {} {
     my set out ""

     set url  [my getMainUrl]8179
     set html [::wikireap::ns_geturl $url]
     set html [string map  [list "&quot;" \x22 "&amp;" & "&lt;" < "&gt;" > "&#39;" '] $html]
     set res [list]
     foreach {full name number} [regexp -inline -all {<a href="/\d+">([^<]+)</a> \((\d+)\)</li>} $html] {
         lappend res [list $name $number]
     }
     return $res
}
