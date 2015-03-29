IDE::DocGeneratorMain instproc saveCss {} {
   set mf [open [file join [my getOutDir] docu.css] w]
   fconfigure $mf -encoding utf-8
   puts $mf {
H1,H2,H3,H4,H5,H6 {
	font-family: Geneva, Arial, Helvetica, sans-serif;
}
.memitem {
  width-min: 200px;
  padding: 4px;
  background-color: #eef3f5;
  border-width: 1px;
  border-style: solid;
  border-color: #dedeee;
  -moz-border-radius: 8px 8px 8px 8px;
}
.memname {
  white-space: nowrap;
  font-weight: bold;
  font-family: Geneva, Arial, Helvetica, sans-serif;
}
.memproto {
  background-color: #d5e1e8;
  border-width: 1px;
  border-style: solid;
  border-color: #84b0c7;
  -moz-border-radius: 8px 8px 8px 8px;
}
.compcomment {
    background-color: #D0E0E0;
  border-width: 1px;
  border-style: solid;
  border-color: #dedeee;
   -moz-border-radius: 8px 8px 8px 8px;
}
.objcomment {
    background-color: #D0E0E0;
  border-width: 1px;
  border-style: solid;
  border-color: #dedeee;
   -moz-border-radius: 8px 8px 8px 8px;
}
.memcomment {
  margin-left: 5pt;
}
pre {
  background-color: #C0D0D0;
  margin-left: 5pt;
  margin-top: 2pt;
  margin-bottom: 2pt;
  margin-right: 5pt;
  padding: 2pt;
  border-width: 1px;
  border-style: solid;
  border-color: #dedeee;
   -moz-border-radius: 8px 8px 8px 8px;
}
   }
   close $mf
}
