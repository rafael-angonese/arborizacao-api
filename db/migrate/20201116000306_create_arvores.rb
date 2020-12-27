class CreateArvores < ActiveRecord::Migration[6.0]
  def change
    create_table :arvores do |t|
      t.string :especie
      t.string :folha
      t.string :fruto
      t.text :raiz
      t.string :altura
      t.string :latitude
      t.string :longitude
      t.references :genero, null: false, foreign_key: true
      t.references :familium, null: false, foreign_key: true
      t.references :grupo, null: false, foreign_key: true
      t.references :origem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
