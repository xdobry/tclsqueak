IDE::Editor instproc goToLine {} {
    while 1 {
        set res [IDE::IDialogEntry getValueWithCancel "Type line number to jump"]
        if {$res eq "_cancel"} {
            return
        }
        set res [string trim $res]
        if {[catch {expr {$res+1}}] || $res<=0} {
            IDE::Dialog error "Expect a number > 0"
            continue
        }
        set twin [my getTextWindow]
        focus $twin
        $twin mark set insert $res.0
        $twin see insert
        break
    }
}
