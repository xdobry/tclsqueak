IDE::DocGeneratorComponent instproc componentComment {} {
   set text "<h2>Component [[my componentObj] getName]</h2>\n"
   set comment [[my componentObj] getComment]
   if {$comment ne ""} {
       append text "<div class=\"compcomment\">[my getComment $comment]</div>"
   }
   return $text
}
