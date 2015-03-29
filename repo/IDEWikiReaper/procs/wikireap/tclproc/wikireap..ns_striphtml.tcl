proc wikireap::ns_striphtml {-tags_only html} {
         regsub -all -- {<[^>]+>} $html "" html
         return $html ;# corrected a typo here
     }
