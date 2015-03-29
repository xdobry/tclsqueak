IDE::AbstractClassView instproc searchUsage actual {
    if {[Object isclass $actual]} {
        IDE::MethodBrowser searchClassUsage $actual
    } else {
        my upsMessage "$actual is not a class"
    }
}
