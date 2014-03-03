#!/usr/bin/env ruby
class ShapeBranch
  def initialize(url,oldVersion,newVersion)
    @url=url
    @oldV=oldVersion
    @newV=newVersion
    @poms=[]
  end

  def printVariable
    p 'url='+@url+' old version='+@oldV+' new version='+@newV
  end

  def _loadPom(url)
    Dir.foreach(url){|e|
      if e=='.'||e=='..'||e=='target' then next end
      _f=url+"\\"+e
      if e=='pom.xml' then @poms<<_f end
      if File.directory? _f then  _loadPom _f end
    }
  end

  def changeVersion
    printVariable
    a=0
    #load poms
    p 'loading pom.xml'
    _loadPom @url
    p @poms.length.to_s+' pom.xml loaded'
    #loop pom and replace the old version
    @poms.each{|pom|
      #search and replace
      file=File.read(pom)
      if file.scan(/#{@oldV}/).length<=0 then next end
      buffer=file.gsub(/#{@oldV}/,@newV)
      if not File.writable? pom then
        #check out the file first
        File.open(pom).chmod(0755)
      end
      File.write(pom,buffer)
      a+=1
    }
    p a.to_s+' pom.xml converted'
  end
end
exec 'ls'
exec 'pwd'
shapeBranch=ShapeBranch.new("C:\\dev\\stubhub\\domain\\fulfillment\\pb_fulfillment_revamp", '1.9-SNAPSHOT', '1.pb_fulfillment_revamp.0-SNAPSHOT')
#shapeBranch=ShapeBranch.new("C:\\dev\\stubhub\\domain\\fulfillment\\pb_fulfillment_revamp","1.pb_fulfillment.0-SNAPSHOT","1.9-SNAPSHOT")
shapeBranch.changeVersion
