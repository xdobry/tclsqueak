IDE::DefVersionDescription instproc evalBody body {
    set objDesc [my getObjectDescription]
    if {[$objDesc isTrackingOn]} {
        $objDesc setDefBody $body
        $objDesc updateDefbody 1 0
    }
}
