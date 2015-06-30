PrsContext instproc check_spawn {count command notifier} {
    my addVariable spawn_id $command $notifier unknown
    my addVariable user_spawn_id $command $notifier unknown
    my addVariable error_spawn_id $command $notifier unknown
    my addVariable tty_spawn_id $command $notifier unknown
}
