$:.unshift File.expand_path(File.dirname(__FILE__))
$:.unshift File.join(File.dirname(__FILE__), 'lib/')

require 'railsdav'

if defined? ActionController::AbstractRequest::HTTP_METHODS
  ActionController::AbstractRequest::HTTP_METHODS << 'propfind'
  ActionController::AbstractRequest::HTTP_METHODS << 'lock'
end

if defined? ActionController::ACCEPTED_HTTP_METHODS
  ActionController::ACCEPTED_HTTP_METHODS.add('propfind')
  ActionController::ACCEPTED_HTTP_METHODS.add('lock')
end

ActionController::Base.send(:include, Railsdav)
ActionController::Base.send(:include, Railsdav::ActAsFileWebDav)