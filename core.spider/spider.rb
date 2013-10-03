#!/usr/bin/env ruby
require 'open-uri'
class Spider
  def self.scan(uri)
    #url='http://www.google.com/search?q=ruby'
    open(uri){|page| page_content=page.read()
      p page_content
      links=page_content.scan(/www.ruby*/).flatten
      links.each{|e| p e
    }
    }
    end
end

Spider.scan 'http://www.google.com/search?q=ruby'