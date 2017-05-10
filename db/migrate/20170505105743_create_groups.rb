class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string   :name, index: true, null: false
      t.timestamps
    has_many :users, through: group_users
    has_many :group_users
    end
  end
end