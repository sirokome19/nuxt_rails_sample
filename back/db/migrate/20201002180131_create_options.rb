class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.integer :choice_id, null: false
      t.string "text"
      t.string "image_url"

      t.timestamps
    end
  end
end
