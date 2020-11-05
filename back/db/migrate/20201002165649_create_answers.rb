class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :order_answer, foreign_key: { on_delete: :cascade}
      # for choice
      t.references :option, foreign_key: {on_delete: :cascade}, null:true
      # for free
      t.integer :free_question_id
      t.string :text

      t.timestamps
    end
    add_column :answers, :type, :string
  end
end
