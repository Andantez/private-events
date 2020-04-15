class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :description
      t.string :title
      t.string :address

      t.timestamps
    end
  end
end
