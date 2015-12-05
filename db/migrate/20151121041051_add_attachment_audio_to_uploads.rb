class AddAttachmentAudioToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :uploads, :audio
  end
end
