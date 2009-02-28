$:.unshift File.expand_path(File.dirname(__FILE__))
$:.unshift File.join(File.dirname(__FILE__), 'lib/')

require 'railsdav'

ActionController::AbstractRequest::HTTP_METHODS << 'propfind'
ActionController::AbstractRequest::HTTP_METHODS << 'lock'

ActionController::Base.send(:include, Railsdav)
ActionController::Base.send(:include, Railsdav::ActAsFileWebDav)