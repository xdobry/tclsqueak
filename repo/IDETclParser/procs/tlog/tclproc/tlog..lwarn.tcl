proc tlog::lwarn message {
    puts "warn: [uplevel subst $message]"
}
