# Extend Xotcl Library for XotclIDE purposes
# All Classes can belong (be defined) by an Component 
# (or can be extendet by Component)
# There is same Default Component "default" for all Classes,
# which does not belong to any Component
# Class and Object are extended with methods for handlig
# additional metainformation as Component and Method Categories

if {$tcl_platform(platform) eq "windows"} {
    set ad [pwd]
    cd $tcl_library
    package require XOTcl
    cd $ad
}
if {![info exists xotcl::version]} {
    puts "loading XOTcl"
    package require XOTcl
}
package require Tk 8.5

namespace import -force xotcl::*


Class instproc moveToComponent {app} {
    puts "class moveToComponent deprecated"
    set oldapp [my getCompObject]
    $oldapp removeClass [self]
    my setMetadata component $app
    set newapp [IDE::Component getCompObjectForName $app]
    $newapp addClass [self]
}


Object instproc inspect {} {
    my basicInspect
}
Object instproc basicInspect {} {
    IDE::ObjectBrowser newBrowser [self]
}
Object instproc halt {{symbol {}}} {
    if {[Object isobject IDE::Debugger]} {
       IDE::Debugger startDebugging $symbol
    }
}

Object instproc getComponentName {} {
    puts "deprecated object getComponentName"
    if {[my hasMetadataNotEmpty component]} {
	return [my getMetadata component]
    }  else {
	return default
    }
}
Object instproc getCompObject {} {
    puts "deprecated object getCompObject"
    if {[my hasMetadataNotEmpty component]} {
	return [IDE::Component getCompObjectForName [my getMetadata component]]
    }  else {
	return [IDE::Component getCompObjectForName default]
    }
}
Object instproc moveToComponent {app} {
    puts "object moveToComponent deprecated"
    ::set oldapp [my getCompObject]
    $oldapp removeObject [self]
    my setMetadata component $app
    ::set newapp [IDE::Component getCompObjectForName $app]
    $newapp addObject [self]
}

Object instproc printString {} {
    # please overweite it to specify your Object printSring
    # the return shoul short specify the object contens for
    # displaying in object inspector
    return "[self] instance of [[self] info class] [[self] info mixin]"
}
Object instproc getDescription {} {
    puts "absolete getDescription call"	 
    if {[Object isobject [self]::description]} {
        return [self]::description
    }
    return
}

# Metadata wrapper from old versions
Object instproc metadata args {
    puts "[self] metadata $args"
    if {[llength $args]==2} {
       my setMetadata [lindex $args 0] [lindex $args 1]
    } else {
	puts "calling metadata [self callingclass]>>[self callingproc] by [self callingobject]"
    }
    next
}
Object instproc hasMetadata key {
    my exists _idemeta($key)
}
Object instproc hasMetadataNotEmpty key {
    expr {[my hasMetadata $key] && [my set _idemeta($key)] ne ""}
}
Object instproc getMetadata key {
    my set _idemeta($key)
}
Object instproc setMetadata {key value} {
    my set _idemeta($key) $value
}


Class IDEMetadataAnalyzer
IDEMetadataAnalyzer instproc unknown {args} {
    if {[llength $args]==4 && [lindex $args 1] eq "idemeta" && [Object isobject [lindex $args 0]]} {
        #  $object setMetadata $type $value
	[lindex $args 0] setMetadata [lindex $args 2] [lindex $args 3]
    } else {
	my lappend metaList $args
    }
}

if {[info procs @] ne ""} {
    rename @ {}
}

IDEMetadataAnalyzer create @

