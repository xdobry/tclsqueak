IDE::TCore instproc testEClassQuerring {} {
   my instvar obj
   set introProxy [my getIntroProxy]
   if {[$introProxy getMethodsForCategoryBForObject TestB c1 {}] ne "m1"} { error {category error1}}
   $introProxy getAllInstMethodsForClass TestA
   if {[$introProxy getCategoriesBForObject TestA {}] eq ""}  { error {category error3}}
   if {[$introProxy getCategoryForMethodBForObject TestA m1 {}] ne "c1"}  { error {category error2}}
   if {[$introProxy getComponentNameForObject TestA] ne "TestCase"} { error {component1}}
   if {[$introProxy getCompObjectFor TestA] ne $obj} { error {component2}}

   $introProxy getDeepChildrenForClass TestA
   $introProxy getHeritageForClass TestB

   $introProxy getAllFullInstMethodsForClass TestB
   if {[$introProxy getDeepChildrenForClass TestA] eq ""} { error {herritage error3}}
}
