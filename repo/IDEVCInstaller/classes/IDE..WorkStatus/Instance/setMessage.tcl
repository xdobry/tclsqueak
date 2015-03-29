IDE::WorkStatus instproc setMessage mes {
   [self] instvar win
   $win configure -text $mes
   update idletasks
}
