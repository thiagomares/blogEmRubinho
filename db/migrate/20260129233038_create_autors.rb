class CreateAutors < ActiveRecord::Migration[8.1]
  def change
    create_table :autors do |t|
      t.string :name
      t.string :local

      t.timestamps
    end
  end
end
