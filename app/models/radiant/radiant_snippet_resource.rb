#
# Snippets
#
class Radiant::RadiantSnippetResource < RadiantFileResource

  #
  # Initialize a file resource
  # +path_prefix+ a prefix to the path
  # +record+ ActiveRecord model
  #
  def initialize(path_prefix, record)
    @record = record
    @path = "#{path_prefix}snippets/#{record.name}#{filter_extension}"
  end

  def getcontenttype
    filter_content_type
  end
end