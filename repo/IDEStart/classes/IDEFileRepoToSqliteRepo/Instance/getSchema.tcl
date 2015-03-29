IDEFileRepoToSqliteRepo instproc getSchema {} {
    return {
CREATE TABLE Object (
  objectid integer PRIMARY KEY,
  timest TIMESTAMP(14) DEFAULT NULL,
  versioninfo varchar(30),
  isclosed bool DEFAULT 0,
  isextension bool DEFAULT 0,
  name varchar(50),
  defbody text,
  metadata text,
  userid int DEFAULT NULL,
  basedon int DEFAULT NULL,
  type varchar(20),
  infoid int
);
CREATE TABLE Method (
  methodid integer PRIMARY KEY,
  timest TIMESTAMP(14) DEFAULT NULL,
  versioninfo varchar(30),
  name varchar(50),
  category varchar(50),
  objectname varchar(50),
  basedon int DEFAULT NULL,
  userid int DEFAULT NULL,
  body text,
  type varchar(20),
  infoid int
);
CREATE TABLE ObjectMethod (
  objectid int NOT NULL,
  methodid int NOT NULL,
  PRIMARY KEY (objectid,methodid)
);
CREATE TABLE Component (
  componentid integer PRIMARY KEY,
  ootype varchar(20),
  timest TIMESTAMP(14) DEFAULT NULL,
  versioninfo varchar(30),
  isclosed bool DEFAULT 0,
  name varchar(50),
  userid int DEFAULT NULL,
  defcounter int DEFAULT '0',
  basedon int DEFAULT NULL,
  infoid int
);
CREATE TABLE ComponentObject (
  componentid int NOT NULL,
  objectid int NOT NULL,
  deforder int,
  PRIMARY KEY (componentid,objectid)
);
CREATE TABLE ComponentRequire (
  componentid int NOT NULL,
  name varchar(50)
);
CREATE TABLE Userlib (
  userid integer PRIMARY KEY,
  name varchar(30),
  longname varchar(60)
);
CREATE TABLE Info (
  infoid integer PRIMARY KEY,
  infotext text
);
CREATE TABLE Configmap (
  configmapid integer PRIMARY KEY,
  name varchar(50),
  timest TIMESTAMP(14) DEFAULT NULL,
  versioninfo varchar(30),
  isclosed bool DEFAULT 0,
  userid int DEFAULT NULL,
  basedon int DEFAULT NULL,
  prescript text,
  postscript text,
  infoid int
);
CREATE TABLE ConfigmapComponent (
  configmapid int NOT NULL,
  componentid int NOT NULL,
  loadorder float,
  PRIMARY KEY (configmapid,componentid)
);
CREATE TABLE ConfigmapChildren (
  configmapid int NOT NULL,
  configmapchildid int NOT NULL,
  loadorder float,
  PRIMARY KEY (configmapid,configmapchildid)
);
    }
}
