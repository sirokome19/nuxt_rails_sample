class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :order_question, foreign_key: { on_delete: :cascade}
      t.string :text
      t.timestamps
    end
    add_column :questions, :type, :string
  end
end
