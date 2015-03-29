IDE::CompView instproc registerClass actual {
    set cls [IDE::ClassSelector getUnregisteredClass]
    if {$cls eq ""} return
    if {![[my info parent]::classview canModifyComponent]} return
    set introProxy [my getIntroProxy]
    if {$introProxy ne ""} {
        $introProxy moveToComponent $cls $actual
    }
}
