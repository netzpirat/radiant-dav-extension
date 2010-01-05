#
# A radiant resource that will be represent by a
# WebDav directory
#
class RadiantDirectoryResource < RadiantBaseResource

  #
  # Initialize the WebDav directory
  # +path+ path of the directory
  # +&children+ block to retrieve the children
  #
  def initialize(path, &children)
    @path = path
    @children = children.call
  end

  #
  # children for this directory
  #
  def children
    @children
  end

end