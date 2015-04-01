IDE::WikiReapMixin instproc reap page {
     my set out ""

     set url  [my getMainUrl][::wikireap::ns_urlencode $page]
     set now  [clock format [clock seconds] -format "%e %b %Y, %H:%M" -gmt 1]
     set html [::wikireap::ns_geturl $url]

     # can't imagine why these characters would be in here, but just to be safe
     set html [string map [list \x00 "" \x0d ""] $html]
     if {[string first "<pre class='sh_tcl'>" $html]>0} {
         set html [string map [list {<pre class='sh_tcl'>} \x00 </pre> \x0d] $html]
     } else {
         my halt
         set html [string map [list {<pre class=''>} \x00 </pre> \x0d] $html]
     }

     if {![regexp -nocase {<title>([^<]*)</title>} $html => title]} {
         set title "(no title!?)"
     }

     set re {Updated ([^G]+) by}
     if {![regexp -nocase $re $html => updated]} {
         set updated "???"
     }


     my preamble $title $url $now $updated
     set html [::wikireap::ns_striphtml -tags_only $html]

     foreach chunk [regexp -inline -all {\x00[^\x0d]+\x0d} $html] {
         set chunk [string range $chunk 1 end-1]
         set chunk [string map  [list "&quot;" \x22 "&amp;" & "&lt;" < "&gt;" > "&#39;" '] $chunk]

         foreach line [split $chunk \n] {
             if {[string index $line 0] == " "} {
                 set line [string range $line 1 end]
             }
             my output $line
         }
     }
     my postamble
 }
