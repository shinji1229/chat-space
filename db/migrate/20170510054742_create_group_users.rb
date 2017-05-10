class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|

      t.timestamps
    belongs_to :user
    belongs_to :group
    end
  end
end
