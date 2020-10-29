class CreateOrderAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :order_answers do |t|
      t.references :answer_sheet, foreign_key: true
      t.timestamps
    end
  end
end
