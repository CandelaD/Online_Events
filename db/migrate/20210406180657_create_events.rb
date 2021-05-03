class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :status
      t.text :description
      t.string :host
      t.date :event_date
      t.time :event_time

      t.timestamps
    end
  end
end
