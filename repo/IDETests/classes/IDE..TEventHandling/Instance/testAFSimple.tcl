IDE::TEventHandling instproc testAFSimple {} {
    # no syntax check
    Object ta -mixin IDE::EventHandlerMix
    Object tb -mixin IDE::EventHandlerMix
    ta proc sensor {t1} {my set t1 $t1}
    ta proc sensor2 {} {my set t2 1}
    ta proc sensor3 {a b} {my set t3 $a; my set t4 $b}
    tb addEventInteres ta sensor event1
    tb addEventInteres ta sensor2 event2
    tb addEventInteres ta sensor3 event3 par1
    tb addEventInteres ta sensor event4 par4
    tb signalEvent event1 parValue1
    tb signalEvent event2
    tb signalEvent event3 par2
    my assert {[ta set t1] eq "parValue1"}
    my assert {[ta set t2]==1}
    my assert {[ta set t3] eq "par1"}
    my assert {[ta set t4] eq "par2"}
    tb signalEvent event4
    my assert {[ta set t1] eq "par4"}
}
