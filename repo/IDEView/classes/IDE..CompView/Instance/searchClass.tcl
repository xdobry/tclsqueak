IDE::CompView instproc searchClass {{class {}}} {
    if {$class eq ""} {
        set class [IDE::ClassSelector getClass {Open Type}]
    }
    if {$class eq ""} return
    set introProx [IDE::XOIntroProxy getIntroProxyForObject $class]
    if {$introProx eq ""} return
    my setSelectedItem [$introProx getComponentNameForObject $class]
    if {[$introProx isObjectClass $class]} {
        set shouldView Classes
    } else {
        set shouldView Objects
    }
    if {[[my info parent]::classview set vtype] ne $shouldView} {
        [my info parent]::classview @stateButton changeStateTo $shouldView
    }
    [my info parent]::classview setSelectedItem [string trimleft $class :]
}
