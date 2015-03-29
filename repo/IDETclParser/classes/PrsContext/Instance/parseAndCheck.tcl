PrsContext instproc parseAndCheck script {
    # do not check if script contain magic string "no syntax check"
    if {[string first "no syntax check" $script]>=0} return
    my parseAndVisit $script
}
