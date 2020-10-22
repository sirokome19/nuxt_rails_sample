class CreateAnswerSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_sheets do |t|
      t.references :user, foreign_key: true, index:false, null:false
      t.references :questionnaire, foreign_key: true, index:false, null:false

      t.timestamps
    end
    add_index :answer_sheets, [:user_id, :questionnaire_id], unique: true
  end
end
