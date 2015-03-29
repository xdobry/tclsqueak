IDE::TCore instproc testEAddCategories {} {
   set introProxy [my getIntroProxy]
   $introProxy moveToCategoryBForObject TestA m1 c1 {}
   $introProxy moveToCategoryBForObject TestA m2 c1 {}
   $introProxy moveToCategoryBForObject TestB m1 c2 {}
   $introProxy uncategoryForBForObject TestB m1 {}
   $introProxy moveToCategoryBForObject TestB m2 c2 {}
   $introProxy deleteCategoryBForObject TestB c2 {}
   $introProxy moveToCategoryBForObject TestB m1 c1 {}
   $introProxy moveToCategoryBForObject TestC m1 c1
   $introProxy moveToCategoryBForObject TestC m2 c2
}
