class Gallery::RadiantGalleryResource < RadiantDirectoryResource

  #
  # Initialize the gallery directory
  # +path+ path of the WebDAV directory
  # +record+ Page ActiveRecord model
  #
  def initialize(path, record)
    @record = record
    @children = []
    @path = "#{path}/#{record.name}"

    # Add child galleries
    @record.children.each do |g|
      @children << Gallery::RadiantGalleryResource.new("#{@path}/#{g.name}", g)
    end

    # Add items
    @record.items.each do |i|
      @children << Gallery::RadiantGalleryItemResource.new("#{@path}/#{i.filename}", i, record)
    end

  end

  def displayname
    record.name
  end

  #
  # Remove the resource
  #
  def delete!
    record.destroy
  end

end