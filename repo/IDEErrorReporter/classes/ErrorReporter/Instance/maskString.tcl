ErrorReporter instproc maskString string {
     string map [list & "&amp;" < "&lt;" > "&gt;" \" "&quot;"] $string
}
