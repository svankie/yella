# coding: utf-8

require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'fileutils'
require 'lib/yella'

include FileUtils

spec = Gem::Specification.new do |s|
  s.name = 'yella'
  s.version = Yella::VERSION
  s.summary = 'Whoever yells louder... wins. BEST GAME EVER?!'
  s.description = 'My first attempt at minimalistic game development with Ruby.'
  s.authors = ['Horacio Bertorello']
  s.email = 'svankie@gmail.com'
  s.homepage = 'https://www.github.com/svankie/yella'
  s.executables = ['yella']
  s.rubyforge_project = 'yella'
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  s.files = Dir.glob('{bin,lib}/**/*')
  s.require_path = 'lib'
  s.bindir = 'bin'
  s.add_dependency('gosu', '>= 0.7.15')
  s.add_dependency('chingu' '>= 0.2.1')
  s.post_install_message = <<INSTALL_MESSAGE
************************************************
HEY! TO PLAY, JUST RUN 'yella' FROM THE CONSOLE!
************************************************
INSTALL_MESSAGE
end

Rake::GemPackageTask.new(spec) do |p|
  p.need_tar = true if RUBY_PLATFORM !~ /mswin/
end

desc "Install yella gem #{Yella::VERSION}"
task :install => [:test, :package] do
  sh %{sudo gem install pkg/yella-#{Yella::VERSION}.gem}
end

desc "Uninstall yella gem"
task :uninstall => [:clean] do
  sh %{sudo gem uninstall yella}
end

desc "Release yella gem #{Yella::VERSION}"
task :release => [:test, :package] do
  sh %{gem push pkg/yella-#{Yella::VERSION}.gem}
end
