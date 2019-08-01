class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.string :name
      t.text :content
      t.integer :line
      t.references :folder, foreign_key: true

      t.timestamps
    end
  end
end
