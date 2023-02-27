class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.bigint :user_id
      t.bigint :space_id
      t.date :start_date_time
      t.date :end_date_time
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
