class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :order_answer, foreign_key: true
      # for choice
      t.references :option, foreign_key: true, null:true
      # for free
      t.integer :free_question_id
      t.string :text

      t.timestamps
    end
    add_column :answers, :type, :string
  end
end
