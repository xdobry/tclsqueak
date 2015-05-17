IDE::Component instproc asScript {{nometa 0} {norequire 0}} {
    my instvar requiredComp version namespace
    set script {}
    set initscript {}
    set defList [my getObjectDefineList]
    append script [my getLicense]
    append script "# created with TclSqueak\n"
    if {$requiredComp ne ""} {
        append script "# script require component [list $requiredComp]\n"
    }
    if {!$norequire} {
        append script "package provide [my getName] [my getVersionNumber]\n"
        foreach reqComp [lsort $requiredComp] {
            append script "package require $reqComp\n"
        }
        set systemRequirements [my getSystemRequirements]
        foreach reqComp $systemRequirements {
            if {$reqComp ni $requiredComp} {
                append script "package require $reqComp\n"
            }
        }
        if {[my getOOType] eq "XOTcl" && "XOTcl" in $systemRequirements} {
            append script "catch {namespace import xotcl::*}\n"
            # needed for xotcl light
        } else {
            if {!$nometa} {
               append script {if {[namespace which @] eq ""} {  proc @ args {#}}} "\n"
            }
        }
    }
    if {!$nometa} {
        append script [my getCommentBody]
    }
    if {[info exists namespace] && $namespace ne ""} {
        append script "namespace eval [list $namespace] {}\n"
    }
    foreach pg [lsort [my getProcsGroups]] {
        set pgobj [my getProcsGroupWithName $pg]
        append script [$pgobj getBody $nometa]
    }
    set introProxy [my getIntroProxy]
    foreach object $defList {
        append script [my getObjectBody $object $nometa]
        if {"initializeAfterLoad" in [$introProxy getClassMethods $object _all_categories]} {
            append initscript "catch {$object initializeAfterLoad}\n"
        }
    }
    append script $initscript
    return $script
}
