IDE::ConfigurationMap instproc loadAndRun {} {
    my instvar prescript postscript
    if {[catch {namespace eval :: $prescript} ret]} {
        IDE::Dialog message "prescript has failed with message $ret"
    }
    my load
    if {[catch {namespace eval :: $postscript} ret]} {
        IDE::Dialog message "prescript has failed with message $ret"
    } else {
        IDE::Transcript warning "configmap [my getName] was loaded and started"
    }
}
