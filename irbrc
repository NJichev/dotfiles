#!/usr/bin/ruby

require 'irb/completion'
require 'irb/ext/save-history'
require 'active_support/all'
require 'pathname'
require 'fileutils'
require 'open-uri'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end

# When I open the IRB, I probably wanna have those around.
# When I open IRB inside of a gem, I want its lib folder in load paths.
$LOAD_PATH << './lib'

begin
  # When inside a gem, try to require it.
  require Pathname.pwd.basename.to_s
rescue LoadError
  # Maybe we are not inside of a gem. That's fine.
end

begin
  require 'active_support/all'
rescue LoadError
  # Well, I tried.
end

def delete_sidekiq
  if defined? Sidekiq::RetrySet
    q = Sidekiq::RetrySet.new
    q.map(&:delete)
  else
    puts 'Sidekiq not loaded.'
  end
end

