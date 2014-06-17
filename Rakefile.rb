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
require 'yaml'

desc "Print the current version number."
task :version do
  puts OLE_QA::Framework::VERSION
end

desc "Print version info for the latest compatible OLE release."
task :works_with do
  puts OLE_QA::Framework::OLE_VERSION
end

desc 'Interactively configure config/options.yml'
task :configurator do
  config_file = File.open('config/options.yml','r')
  options     = YAML.load(config_file)
  config_file.close

  options.each do |k,v|
    puts "#{k.to_s.ljust(20)}:  #{v}"
    puts "... (k)eep or (c)hange? [k|c]"
    ans = STDIN.gets.chomp
    if ans =~ /[Cc]/
      puts "Enter new value:"
      new_val    = STDIN.gets.chomp
      if v.is_a?(TrueClass) || v.is_a?(FalseClass)
        new_val.match(/^[Tt]/) ? new_val = true : new_val = false
      else
        new_val = new_val.to_i unless new_val.to_i == 0
      end
      options[k] = new_val
      puts "#{k.to_s.ljust(20)} updated to:  #{new_val}"
    end
  end

  config_file = File.open('config/options.yml','w')
  YAML.dump(options,config_file)
  config_file.close

end

desc 'Show current options in config/options.yml'
task :show_config do
  config_file = File.open('config/options.yml','r')
  options     = YAML.load(config_file)
  config_file.close
  options.each do |k,v|
    puts "#{k.to_s.ljust(20)}:  #{v}"
  end
end