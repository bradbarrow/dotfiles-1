require 'rake'

desc "install the dot files into user's home directory"
task :install do
  switch_to_zsh

  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md]
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file}")
        puts "identical ~/.#{file}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  if false#file =~ /zshrc$/ # copy zshrc instead of link
    puts "copying ~/.#{file}"
    system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  unless ENV["SHELL"] =~ /zsh/
    puts "switching to zsh"
    system %Q{chsh -s `which zsh`}
  end
end
