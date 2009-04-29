#
# Javascripts
#
class Sns::RadiantJavascriptResource < Sns::RadiantSnsResource

  #
  # Initialize a file resource
  # +record+ ActiveRecord model
  #
  def initialize(record)
    @record = record
    @path = record.name =~ /\.js$/ ? "javascripts/#{record.name}" :  "javascripts/#{record.name}.js"
  end

  def getcontenttype
    "text/javascript"
  end
end