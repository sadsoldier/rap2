class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :source
      t.string :destination
      t.string :timestamp
      t.string :filename
      t.integer :size
      t.timestamps
    end
    add_index :records, :filename
  end
end
