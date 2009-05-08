#
# Paperclipped assets
#
class Paperclipped::RadiantAssetResource < RadiantFileResource

  #
  # Initialize an asset resource
  # +record+ ActiveRecord model
  #
  def initialize(record)
    @record = record
    @path = "assets/#{record.asset_file_name}"
  end

  #
  # Creates a new paperclip asset
  # +path+ the resource path
  # +content+ the resource content
  #
  def self.create(path, content)
    require 'tmpdir'
    File.open(File.join(Dir.tmpdir, File.basename(path)), 'w+') do |upload|
      upload.write(content)
      asset = Asset.create
      asset.asset.assign(upload)
      asset.save!
    end
  end

  def getcontenttype
    @record.asset_content_type
  end

  def getcontentlength
    @record.asset_file_size
  end

  def data
    File.new(absolute_asset_path)
  end

  def write!(content)
    File.open(absolute_asset_path, 'w') {|asset| asset.write(content) }
    record.asset.reprocess!
    record.save
  end

  def delete!
    record.asset.destroy
    record.destroy
  end
  
  private

    def absolute_asset_path
      "#{RAILS_ROOT}/public/assets/#{@record.id}/#{@record.asset_file_name}"
    end

end