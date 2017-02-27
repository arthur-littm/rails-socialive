class CreateLivestreams < ActiveRecord::Migration[5.0]
  def change
    create_table :livestreams do |t|
      t.date :date_time_of_stream
      t.integer :tickets_sold
      t.integer :tickets_available
      t.string :category

      t.timestamps
    end
  end
end
