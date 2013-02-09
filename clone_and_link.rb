#!/usr/bin/env ruby
`git clone git://github.com/vlc/dot-files.git ~/.dot-files` unless File.directory?("#{ENV['HOME']}/.dot-files")

def process_dir(dir)
  Dir.new(dir).each { |f| 
    # skip (1) git dir (2) "." and ".." (3) this file
    next if f =~ /.git$/ || f =~ /^\.*$/ || f =~ /clone_and_link/
    source = File.join(dir, f)
    target = source.gsub(/.dot-files\/files\//, "")
    if File.directory?(source)
      next if File.symlink?(target)
      `mkdir -p #{target}`
      p "Processing directory #{target} recursively"
      process_dir(source)
    else
      str = "ln -vsf \"#{source}\" #{target}"
      `#{str}`
    end
  }
end

process_dir("#{ENV['HOME']}/.dot-files/files")
