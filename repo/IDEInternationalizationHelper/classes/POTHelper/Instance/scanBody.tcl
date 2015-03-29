POTHelper instproc scanBody body {
    set pattern {\[mc "(.+?)"}
    my instvar catalog
    foreach {dummy str} [regexp -all -inline $pattern $body] {
        if {[lsearch -exact $catalog $str]<0} {
            lappend catalog [subst -nocommands -novariables $str]
        }
    }
    #set pattern {\[::msgcat::mc "(.+?)}
    #foreach {dummy str} [regexp -all -inline $pattern $body] {
    #    if {[lsearch -exact $catalog $str]<0} {
    #        lappend catalog $str
    #    }
    #}
}
