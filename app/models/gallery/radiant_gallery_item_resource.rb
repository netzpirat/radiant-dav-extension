class Gallery::RadiantGalleryItemResource < RadiantFileResource

  #
  # Initialize a gallery item resource
  # +path+ path of the parent resource
  # +record+ ActiveRecord model
  # +gallery+ the gallery the item belongs to
  #
  def initialize(path, record, gallery)
    @record = record
    @record.gallery = gallery
    @path = path
    @path_prefix = Radiant::Config['gallery.path_prefix']
  end

  def getcontenttype
    @record.content_type
  end

  def displayname
    @record.filename
  end

  def getcontentlength
    @record.size
  end

  def data
    File.new(@record.absolute_path)
  end

end