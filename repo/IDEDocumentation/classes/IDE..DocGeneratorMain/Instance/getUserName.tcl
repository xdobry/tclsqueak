IDE::DocGeneratorMain instproc getUserName args {
   if {[Object isobject IDE::User]} { 
       return [[IDE::User getDefault] getName]
   } else  {
       return unknown
   }
}
