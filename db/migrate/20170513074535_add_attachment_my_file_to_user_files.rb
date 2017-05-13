class AddAttachmentMyFileToUserFiles < ActiveRecord::Migration
  def self.up
    change_table :user_files do |t|
      t.attachment :my_file
    end
  end

  def self.down
    remove_attachment :user_files, :my_file
  end
end
