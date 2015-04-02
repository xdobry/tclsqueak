proc repobs::asFileName objName {
    string map {:: .. ! %21 # %23 {$} %24 % %25 & %26 ' %27 ( %28 ) %29 * %2A + %2B , %2C / %2F : %3A {;} %3B = %3D ? %3F @ %40 {[} %5B \] %5D .. %2E%2E} $objName
}
