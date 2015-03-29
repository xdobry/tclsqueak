IDE::DestroyMixForward instproc unregisterDestroyForwardObj obj {
    my instvar destroyForwardObjs
    if {[set pos [lsearch $destroyForwardObjs $obj]]>=0} {
        set destroyForwardObjs [lreplace $destroyForwardObjs $pos $pos]
        if {[llength $destroyForwardObjs]==0} {
            my mixin delete ::IDE::DestroyMixForward
        }
    }

}
