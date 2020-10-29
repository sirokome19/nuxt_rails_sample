class CreateOrderQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_questions do |t|
      t.references :questionnaire, foreign_key: { on_delete: :cascade}
      t.integer :order_num, index:false, null:false
      t.timestamps
    end
    add_index :order_questions, [:order_num, :questionnaire_id], unique: true
  end
end
