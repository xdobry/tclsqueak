proc wikireap::ns_urlencode string {
         set allowed_chars  {[a-zA-Z0-9]}
         set encoded_string ""

         foreach char [split $string ""] {
             if {[string match $allowed_chars $char]} {
                 append encoded_string $char
             } else {
                 scan $char %c ascii
                 append encoded_string %[format %02x $ascii]
             }
         }

         return $encoded_string
     }
