#  Copyright 2005-2014 The Kuali Foundation
#
#  Licensed under the Educational Community License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at:
#
#    http://www.opensource.org/licenses/ecl2.php
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

loaddir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(loaddir) unless $LOAD_PATH.include?(loaddir)

require 'rubygems'
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
require 'fileutils'
require 'lib/ole_qa_framework/COMPATIBILITY.rb'

desc "Print the current version number."
task :version do
  puts OLE_QA::Framework::VERSION
end

desc "Print version info for the latest compatible OLE release."
task :works_with do
  puts OLE_QA::Framework::OLE_VERSION
end

desc "Select a config file from lib/config/alt."
task :select_config do
  puts 'Enter filename:  '
  target_file = STDIN.gets.chomp
  target_file += '.yml' unless target_file =~ /\.yml$/
  file_path = "#{loaddir}/lib/config/"
  if File.exists?(file_path + 'alt/' + target_file)
    FileUtils.cp "#{file_path}alt/#{target_file}", "#{file_path}default_options.yml"
    puts "Successfully copied #{file_path}alt/#{target_file}."
  else
    puts "File not found: #{file_path}alt/#{target_file}"
  end
end
