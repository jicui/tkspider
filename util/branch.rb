class Branch
  def self.changeVersion (path,oldVersion,newVersion)
    p 'start to convert version from'+oldVersion+' to version'+newVersion
    poms=[]
    Branch.loadPoms(path,poms)
    p 'loaded poms size= '+poms.length.to_s
    a=0
    poms.each{|i|
      p i
      if File.read(i).scan(/#{oldVersion}/).length>0 then
        buffer=File.read(i).gsub(/#{oldVersion}/,newVersion)
        if not File.writable? i then
          File.open(i).chmod(0755)
        end
        File.write(i,buffer)
        a+=1
      end
    }
    p 'converted poms size='+a.to_s
  end
  def self.loadPoms(path,poms)
    Dir.foreach(path){|e|
      fullPath=path+"\\"+e
      if e=='.'||e=='..'||e=='target' then next end
      if e=='pom.xml' then poms<<fullPath end
      if File.directory?  fullPath then  Branch.loadPoms(fullPath,poms) end
    }
  end
end

Branch.changeVersion("C:\\dev\\stubhub\\domain\\fulfillment\\pb_pdf_parser_1", '1.pb_pdf_parser_1.0-SNAPSHOT', '1.9-SNAPSHOT')