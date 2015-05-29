IDE::TclModeEdit instproc splitCommentSource commentWithSource {
    if {[regexp -indices {^(#[^\n]*\n)+} $commentWithSource commentIndicies]} {
        set comment [string range $commentWithSource 0 [lindex $commentIndicies 1]]
        set source [string range $commentWithSource 1+[lindex $commentIndicies 1] end]
    } elseif {[regexp -indices {^(#[^\n]*\n)*#[^\n]*\n?$} $commentWithSource commentIndicies]} {
        # only comment
        set comment $commentWithSource
        set source ""
    } else {
        set comment ""
        set source $commentWithSource
    }
    list $comment $source
}
