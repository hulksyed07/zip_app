class CreateUserFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_files do |t|

      t.timestamps
    end
  end
end
