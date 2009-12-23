require File.join(File.dirname(__FILE__), '/lib/railsdav')

ActionController::Base.send(:include, Railsdav)
ActionController::Base.send(:include, Railsdav::ActAsFileWebDav)