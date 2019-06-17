class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :location, foreign_key: true
      t.string :text, null: false
      t.string :image, null: false
      t.string :answer, null: false

      t.timestamps
    end
  end
end
