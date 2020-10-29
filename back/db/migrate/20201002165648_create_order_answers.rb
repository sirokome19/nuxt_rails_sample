class CreateOrderAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :order_answers do |t|
      t.references :answer_sheet, foreign_key: true
      t.integer :order_num, index: false, null: false
      t.timestamps
    end
    add_index :order_answers, [:order_num, :answer_sheet_id], unique: true
  end
end
