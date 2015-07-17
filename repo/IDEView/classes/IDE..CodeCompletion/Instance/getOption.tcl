IDE::CodeCompletion instproc getOption {cmdline uoption} {
    my instvar repo
    set basecommand [my getBaseCmdFromLine $cmdline]
    set descs [$repo getCommandDescription $basecommand]
    set ret [list]
    if {[llength [set options [ttype::commandoptionsAll $descs]]]>0} {
        # complete option
        set mlist {}
        set pattern ${uoption}*
        foreach {option argcount} $options {
            if {[string match $pattern $option]} {
                lappend mlist $option
            }
        }
        set ret [list $mlist $pattern]
    }
    return $ret
}
