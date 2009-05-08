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
 
  private

    def absolute_asset_path
      "#{RAILS_ROOT}/public/assets/#{@record.id}/#{@record.asset_file_name}"
    end

end