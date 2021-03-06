class Branch

  def loadPom(target,allPoms)
    Dir.foreach(target) { |e|
      if e=='.'||e=='..'||e=='target' then next end
      _f=target+"\\"+e
      if e=='pom.xml' then allPoms<<_f end
      if File.directory? _f then  loadPom(_f,allPoms) end
    }
  end

  def prompt(msg)
    puts msg
    STDIN.gets
  end

  def updateVersion(path,oldVersion,newVersion)
    if(!path) then
      path=while line=prompt("Please input Path")
             break(line.chomp) if line!="\n"
           end
    end

    if(!oldVersion) then
      oldVersion=while line= prompt("Please input version1")
                   break(line.chomp) if line!="\n"
                 end
    end

    if(!newVersion) then
      newVersion=while line=prompt("Please input verson2")
                   break(line.chomp) if line!="\n"
                 end
    end
    puts "Start converting version  from #{oldVersion}  to #{newVersion} on #{path}"
    cnt=0
    #load poms
    puts "loading pom.xml"
    allPoms=[]
    loadPom(path,allPoms)
    puts allPoms.length.to_s+"pom.xml loaded"
    #loop pom and replace the old version
    allPoms.each do |pom|
      #search and replace
      file=File.read(pom)
      if file.scan(/#{oldVersion}/).length<=0 then next end
      buffer=file.gsub(/#{oldVersion}/,newVersion)
      if not File.writable? pom then
        #check out the file first
        puts "p4 edit #{pom}"
        `p4 edit #{pom}`
      end
      File.write(pom,buffer)
      cnt+=1
    end
    p cnt.to_s+' pom.xml converted'
  end

end
