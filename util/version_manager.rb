#!/usr/bin/env ruby
class ShapeBranch
  def initialize(target)
    @target=target
    @poms=[]
  end

  def printVariable
    p "target=#{@target} old version=#{@oldV} new version=#{@newV}"
  end

  def loadPom(target)
    Dir.foreach(target){|e|
      if e=='.'||e=='..'||e=='target' then next end
      _f=target+"\\"+e
      if e=='pom.xml' then @poms<<_f end
      if File.directory? _f then  loadPom _f end
    }
  end

  def changeVersion (oldVersion,newVersion)
    @oldV=oldVersion
    @newV=newVersion
    printVariable
    a=0
    #load poms
    p 'loading pom.xml'
    loadPom @target
    p @poms.length.to_s+' pom.xml loaded'
    #loop pom and replace the old version
    @poms.each{|pom|
      #search and replace
      p pom
      file=File.read(pom)
      if file.scan(/#{@oldV}/).length<=0 then next end
      buffer=file.gsub(/#{@oldV}/,@newV)
      if not File.writable? pom then
        #check out the file first
        _p4editstr="p4 edit #{pom}"
        p _p4editstr
        exec _p4editstr
      end
        File.write(pom,buffer)
      a+=1
    }
    p a.to_s+' pom.xml converted'
  end

  def integrate (from,to)
    p4str="p4 integrate -i -Dt #{from}... #{to}..."
    p p4str
    exec p4str
  end
end
shapeBranch=ShapeBranch.new("C:\\Users\\jicui\\git\\p4\\stubhub\\domain\\fulfillment\\pb_fulfillment_revamp")
shapeBranch.changeVersion '1.24-SNAPSHOT','1.pb_fulfillment_revamp.0-SNAPSHOT'
#shapeBranch.changeVersion '1.pb_fulfillment_revamp.0-SNAPSHOT', '1.20-SNAPSHOT'
#exec 'p4 submit ' #can not submit?
#shapeBranch.integrate '//sandbox/jicui/t1/','//sandbox/jicui/t2/'

#add checkout functions
#add merge back to main functions
#expose to gli