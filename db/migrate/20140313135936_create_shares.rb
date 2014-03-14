class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :from_user, index: true, class_name: 'User'
      t.references :to_user, index: true, class_name: 'User'
      t.string :email
      t.string :url

      t.timestamps
    end
  end
end
