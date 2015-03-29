POTHelper instproc scanComponent component {
     set cobj [IDE::Component getCompObjectForNameIfExist $component]
     if {$cobj eq ""} {
         error "$component not found"
     }
     foreach pobj [$cobj getProcsGroupsObjects] {
         foreach proc [$pobj getProcsNames] {
             my scanBody [info body $proc]
         }
     }
     foreach obj [$cobj getObjects] {
         foreach proc [$obj info procs] {
              my scanBody [$obj info body $proc]
         }
     }
     foreach obj [$cobj getClasses] {
         foreach proc [$obj info procs] {
              my scanBody [$obj info body $proc]
         }
         foreach iproc [$obj info instprocs] {
              my scanBody [$obj info instbody $iproc]]
         }
     }
}
