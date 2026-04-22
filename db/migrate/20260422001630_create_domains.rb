class CreateDomains < ActiveRecord::Migration[8.0]
  def change
    create_table :domains do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.integer :position, null: false, default: 0

      t.timestamps
    end
    add_index :domains, :name, unique: true
    add_index :domains, :slug, unique: true
    add_index :domains, :position
  end
end
