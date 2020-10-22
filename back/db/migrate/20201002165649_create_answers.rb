class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :answer_sheet, foreign_key: true
      t.references :option, foreign_key: true
      t.timestamps
    end
    add_column :answers, :type, :string
  end
end
