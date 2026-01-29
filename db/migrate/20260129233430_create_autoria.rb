class CreateAutoria < ActiveRecord::Migration[8.1]
  def change
    create_table :autoria do |t|
      t.integer :id_titulo
      t.integer :id_autor

      t.timestamps
    end
  end
end
