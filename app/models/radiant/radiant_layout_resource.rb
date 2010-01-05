#
# Layouts
#
class Radiant::RadiantLayoutResource < RadiantFileResource

  #
  # Initialize a file resource
  # +path_prefix+ a prefix to the path
  # +record+ ActiveRecord model
  #
  def initialize(path_prefix, record)
    @record = record
    @path = "#{path_prefix}layouts/#{record.name}.html"
  end

  def getcontenttype
    "text/html"
  end

end