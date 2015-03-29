IDE::VersionControlQueries proc todayChangedMethods {} {
  set query {SELECT c.name,o.name,m.type,m.name from Component c, ComponentObject co, Object o, ObjectMethod om, Method m where c.componentid=co.componentid and co.objectid=o.objectid and o.objectid=om.objectid and om.methodid=m.methodid and to_days(m.timest)=to_days(now())}
  IDE::DBPersistence queryAsReport $query
}
