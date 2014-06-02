module Branch

  def Branch.load_pom(target)
    dir_poms=Array.new
    Dir.foreach(target) { |e|
      if e=='.'||e=='..'||e=='target' then next end
      file_or_dir=target+"/"+e
      if e=='pom.xml' then dir_poms.push(file_or_dir) end
      if File.directory? file_or_dir then  dir_poms+=Branch.load_pom(file_or_dir) end
    }
    return dir_poms;
  end
  

  def Branch.prompt(msg)
    puts msg
    STDIN.gets
  end

  def Branch.update_version(path,oldVersion,newVersion)
    if(!path) then
      path=while line=prompt("Please input local p4 Path")
             break(line.chomp) if line!="\n"
           end
    end

    if(!oldVersion) then
      oldVersion=while line= prompt("Please input old version")
                   break(line.chomp) if line!="\n"
                 end
    end

    if(!newVersion) then
      newVersion=while line=prompt("Please input new version")
                   break(line.chomp) if line!="\n"
                 end
    end
    puts "Start converting version  from #{oldVersion}  to #{newVersion} on #{path}"
    cnt=0
    #load poms
    puts "loading pom.xml"
    allPoms=Branch.load_pom(path)
    puts allPoms.length.to_s+"pom.xml loaded"
    #loop pom and replace the old version

    allPoms.each do |pom|
      #search and replace
      puts pom
      puts pom.class
      file=File.read(pom)
      if file.scan(/#{oldVersion}/).length<=0 then next end
      buffer=file.gsub(/#{oldVersion}/,newVersion)
      
      if not File.writable? pom then
        #check out the file first
        puts "p4 edit #{pom}"
        #`p4 edit #{pom}`
      end
      File.write(pom,buffer)
      cnt+=1
    end
    p cnt.to_s+' pom.xml converted'
  end

  def Branch.integrate(from,to)
    if(!from) then
      from=while line=prompt("Input the from branch path")
             break(line.chomp) if line!="\n"
           end
    end
    if(!to) then
      to=while line=prompt("Input the to branch path")
           break(line.chomp) if line!="\n"
         end
    end
    `p4 integrate -i -Dt #{from}... #{to}...`
  end

end

#shapeBranch=Branch.update_version("/home/jicui/git/tkspider/util","111","123") 
