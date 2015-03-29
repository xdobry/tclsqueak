IDE::System proc hasTclOO {} {
   expr {[llength [info commands ::oo::define]]>0}
}
