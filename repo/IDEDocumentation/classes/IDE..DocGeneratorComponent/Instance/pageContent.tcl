IDE::DocGeneratorComponent instproc pageContent {} {
  return {<html>
<title>[my getTitle]</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="docu.css">
<body>
[my mainPageLink]
[my componentComment]
[my contentList]
<hr>
[my contentClasses]
[my contentObjects]
[my contentProcs]
</body>
</html>
}
}
