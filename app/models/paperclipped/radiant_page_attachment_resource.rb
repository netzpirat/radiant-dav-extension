#
# Paperclipped page attachment
#
class Paperclipped::RadiantPageAttachmentResource < Paperclipped::RadiantAssetResource

  #
  # Initialize a page attachment
  # +record+ ActiveRecord model
  # +path+ Path of the attached page
  #
  def initialize(record, path)
    @attachment = record
    @record = Asset.find_by_id(@attachment.asset_id)
    @path = "#{path}/assets/#{@record.asset_file_name}" if @record
  end

end