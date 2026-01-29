class CreateTitulos < ActiveRecord::Migration[8.1]
  def change
    create_table :titulos do |t|
      t.string :titulo
      t.string :corpo

      t.timestamps
    end
  end
end
