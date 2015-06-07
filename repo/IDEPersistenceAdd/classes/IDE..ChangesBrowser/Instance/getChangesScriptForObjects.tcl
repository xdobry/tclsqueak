IDE::ChangesBrowser instproc getChangesScriptForObjects {compName class obj1 obj2} {
   set ret "#changes for class $class\n"
   if {[$obj1 istype IDE::ObjectEdition]} {
       set type [$obj1 type]
   } else {
       if {[$obj1 istype IDE::ProcsGroup]} {
           set type ProcsGroup
       } else {
           set type Class
       }
   }
   foreach vtype {Def Class Instance} {
       $obj1 set${vtype}MethodsArray methArr1
       $obj2 set${vtype}MethodsArray methArr2
       set diffMethods [my getDiffFromArrays methArr1 methArr2]
       foreach method $diffMethods {
           if {![info exists methArr1($method)]} {
               append ret "# delete method\n"
               if {$type eq "ProcsGroup"} {
                   append ret "set comp \[IDE::Component getCompObjectForName $compName\]\n"
                   append ret "set pg \[\$comp getProcsGroupWithName $class\]\n"
                   append ret "\$pg deleteMethod $method\n"
               } else {
                   if {$vtype eq "Class"} {
                       append ret "$class proc $method {} {}\n"
                   } elseif {$vtype eq "Instance"} {
                       append ret "$class instproc $method {} {}\n"
                   }
               }
           } else {
               if {![info exists methArr2($method)]} {
                   append ret "# add method\n"
               } else {
                   append ret "# modify method $vtype\n"
               }
               if {$type eq "ProcsGroup"} {
                   append ret "set comp \[IDE::Component getCompObjectForName $compName\]\n"
                   append ret "set pg \[\$comp getProcsGroupWithName $class\]\n"
                   append ret "\$pg handleScript [list [$obj1 get${vtype}MethodBody $method]]\n"
               } else {
                   if {$vtype eq "Def"} {
                       append ret "# Class redifinition \n"
                       if {[info exists methArr2($method)]} {
                           append ret "# old: [$obj2 get${vtype}MethodBody $method] \n"
                       }
                       append ret "# new: [$obj1 get${vtype}MethodBody $method] \n"
                       append ret "set introProxy \[\[IDE::Component getCompObjectForName $compName\] getIntroProxy]\n"
                       append ret "set desc \[\$introProxy getDescriptionForObject $class\]\n"
                       append ret "if \{\$desc ne \"\"\} \{\n"
                       append ret "   \$desc setDefBody [list [$obj1 get${vtype}MethodBody $method]]\n"
                       append ret "   \$desc updateDefbody 0 1\n"
                   } else {
                       append ret [$obj1 get${vtype}MethodBody $method] \n
                   }
               }
           }
       }
       catch {unset methArr1 methArr2}
   }
   return $ret
}
