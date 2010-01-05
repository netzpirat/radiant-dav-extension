#
# Javascripts
#
class Sns::RadiantJavascriptResource < Sns::RadiantSnsResource

  #
  # Initialize a file resource
  # +path_prefix+ a prefix to the path
  # +record+ ActiveRecord model
  #
  def initialize(path_prefix, record)
    @record = record
    @path = record.name =~ /\.js$/ ? "#{path_prefix}javascripts/#{record.name}" :  "#{path_prefix}javascripts/#{record.name}.js"
  end

  def getcontenttype
    "text/javascript"
  end
end