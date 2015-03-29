IDE::ProgEdit instproc getOption {cmdline uoption} {
    set basecommand [my getBaseCmdFromLine $cmdline]
    set repo [SignatureRepository getSignatureRepository]
    set descs [$repo getCommandDescription $basecommand]
    if {[llength [set options [ttype::commandoptions $descs]]]>0} {
        # complete option
        set mlist {}
        set pattern ${uoption}*
        foreach {option argcount} $options {
            if {[string match $pattern $option]} {
                lappend mlist $option
            }
        }
        my invokePopDown $mlist $pattern
    }
}
