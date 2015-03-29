IDE::InterpView instproc createInterp {} {
    set idialog [IDE::CreateInterp new -volatile]
    if {[$idialog prompt] eq "ok"} {
        set name [$idialog set name]
        if {$name ne ""} {
            if {[interp exists $name]} {
                IDE::Dialog error "interp $name already exists"
                return
            }
        } else {
            IDE::Dialog error "empty interp name"
            return
        }
        set loadTk [$idialog set loadTk]
        set safeInterp [$idialog set safeInterp]
        IDE::InterpView createInterp $name $loadTk $safeInterp
        my refresh
    }
}
