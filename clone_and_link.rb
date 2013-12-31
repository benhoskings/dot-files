#!/usr/bin/env ruby
def clone_or_pull(dir, repo)
  if File.directory?(dir)
    `cd #{dir} && git pull`
  else
    `git clone --quiet #{repo} #{dir}`
  end
end

def process_dir(dir)
  Dir.new(dir).each { |f|
    # skip (1) git dir (2) "." and ".." (3) this file
    next if f =~ /.git$/ || f =~ /^\.*$/ || f =~ /clone_and_link/
    source = File.join(dir, f)
    target = source.gsub(/.dot-files\/files\//, "")
    next if File.symlink?(target)

    if File.directory?(source) && !(source =~ /vim/ )
      `mkdir -p #{target}`
      p "Processing directory #{target} recursively"
      process_dir(source)
    else
      str = "ln -vsf \"#{source}\" #{target}"
      if File.exists?(target)
        target_backup = target + ".bak"
        p "moving existing file #{target} out of the way (#{target_backup})"
        `mv #{target} #{target_backup}`
      end
      `#{str}`
    end
  }
end

clone_or_pull("#{ENV['HOME']}/.dot-files", "git://github.com/vlc/dot-files.git")
process_dir("#{ENV['HOME']}/.dot-files/files")

clone_or_pull("#{ENV['HOME']}/.vim/bundle/vundle", "https://github.com/gmarik/vundle.git")
