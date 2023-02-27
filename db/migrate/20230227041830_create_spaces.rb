class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.string :capacity
      t.string :space_type
      t.string :address
      t.string :title
      t.integer :price
      t.bigint :user_id

      t.timestamps
    end
  end
end
