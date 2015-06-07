MySample instproc sayHallo {} {
   expr {1+0x10}
   lindex {1 2 3} [expr 1]+1
   puts "Hallo World"
}
