IDE::InterpView instproc selectItem interp {
    set browser [my info parent]
    $browser selectInterp $interp
}
