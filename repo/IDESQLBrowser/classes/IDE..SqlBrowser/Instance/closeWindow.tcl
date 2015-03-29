IDE::SqlBrowser instproc closeWindow {} {
    if {[my isApplication]} {
        if {[IDE::Dialog yesNo "Do you want to exit application?"]} {
            exit
        }
    } else {
        next
    }
}
