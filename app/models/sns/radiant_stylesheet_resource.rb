#
# Stylesheet
#
class Sns::RadiantStylesheetResource < Sns::RadiantSnsResource

  #
  # Initialize a file resource
  # +record+ ActiveRecord model
  #
  def initialize(record)
    @record = record
    @path = (Object.const_defined?(:SnsSassFilterExtension) && record.filter_id == 'Sass') ? style_path('sass') : style_path('css')
  end

  def getcontenttype
    "text/css"
  end

  private

    #
    # Sets the path for a css stylesheet
    # +type+ The stylesheet type
    #
    # Returns the path of the stylesheet
    #
    def style_path(type)
      @record.name =~ /\.#{type}$/ ? "stylesheets/#{@record.name}" :  "stylesheets/#{@record.name}.#{type}"
    end

end