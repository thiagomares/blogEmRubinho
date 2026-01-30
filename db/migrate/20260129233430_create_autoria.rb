class CreateAutoria < ActiveRecord::Migration[8.1]
  def change
    create_table :autoria do |t|
      t.references :titulo, null: false, foreign_key: true
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
