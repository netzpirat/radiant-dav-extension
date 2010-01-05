#
# Stylesheet
#
class Sns::RadiantStylesheetResource < Sns::RadiantSnsResource

  #
  # Initialize a file resource
  # +path_prefix+ a prefix to the path
  # +record+ ActiveRecord model
  #
  def initialize(path_prefix, record)
    @record = record
    @path = (Object.const_defined?(:SnsSassFilterExtension) && record.filter_id == 'Sass') ? style_path(path_prefix, 'sass') : style_path(path_prefix, 'css')
  end

  def getcontenttype
    "text/css"
  end

  private

    #
    # Sets the path for a css stylesheet
    # +path_prefix+ a prefix to the path
    # +type+ The stylesheet type
    #
    # Returns the path of the stylesheet
    #
    def style_path(path_prefix, type)
      @record.name =~ /\.#{type}$/ ? "#{path_prefix}stylesheets/#{@record.name}" :  "#{path_prefix}stylesheets/#{@record.name}.#{type}"
    end

end