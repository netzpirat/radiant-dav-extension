#
# Sns Resource
#
class Sns::RadiantSnsResource < RadiantFileResource

  #
  # Write new content to the file
  #
  def write!(content)
    super content
    Radiant::Cache.clear
  end

end