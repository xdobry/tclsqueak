proc tlog::lerror message {
    puts "error: [uplevel subst $message]"
}
