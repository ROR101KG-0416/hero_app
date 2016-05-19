class AddAttachmentPhotoToCharacters < ActiveRecord::Migration
  def self.up
    change_table :characters do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :characters, :photo
  end
end
