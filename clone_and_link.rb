#!/usr/bin/ruby 
require 'find'
`git clone git://github.com/vlc/dot-files.git ~/.dot-files` unless File.directory?("#{ENV['HOME']}/.dot-files")

def process_dir(dir)
  Dir.new(dir).each { |f| 
    next if f =~ /.git$/ || f =~ /^\.*$/ || f =~ /clone_and_link/
    source = File.join(dir, f)
    target = source.gsub(/.dot-files\//, "")
    if File.directory?(source)
      process_dir(source) unless File.symlink?(target)
    else
      str = "ln -vsf \"#{source}\" #{target}"
      `#{str}`
    end
  }
end

process_dir("#{ENV['HOME']}/.dot-files")
