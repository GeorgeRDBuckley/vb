class AddAvatarsToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :profile_img
    end
  end

  def self.down
    drop_attached_file :users, :profile_img
  end
end
