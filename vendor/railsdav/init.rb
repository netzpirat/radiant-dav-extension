$:.unshift File.expand_path(File.dirname(__FILE__))
$:.unshift File.join(File.dirname(__FILE__), 'lib/')

require 'railsdav'

if defined? ActionController::Request::HTTP_METHODS
  ActionController::Request::HTTP_METHODS << 'propfind'
  ActionController::Request::HTTP_METHODS << 'lock'
  ActionController::Request::HTTP_METHOD_LOOKUP = ActionController::Request::HTTP_METHODS.inject({}) { |h, m| h[m] = h[m.upcase] = m.to_sym; h }
end

if defined? ActionController::AbstractRequest::HTTP_METHODS
  ActionController::AbstractRequest::HTTP_METHODS << 'propfind'
  ActionController::AbstractRequest::HTTP_METHODS << 'lock'
  ActionController::AbstractRequest::HTTP_METHOD_LOOKUP = ActionController::AbstractRequest::HTTP_METHODS.inject({}) { |h, m| h[m] = h[m.upcase] = m.to_sym; h }
end

if defined? ActionController::ACCEPTED_HTTP_METHODS
  ActionController::ACCEPTED_HTTP_METHODS.add('propfind')
  ActionController::ACCEPTED_HTTP_METHODS.add('lock')
end

ActionController::Base.send(:include, Railsdav)
ActionController::Base.send(:include, Railsdav::ActAsFileWebDav)