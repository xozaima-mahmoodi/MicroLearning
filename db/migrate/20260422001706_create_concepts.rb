class CreateConcepts < ActiveRecord::Migration[8.0]
  def change
    create_table :concepts do |t|
      t.references :domain, null: false, foreign_key: true
      t.string :title, null: false
      t.string :slug, null: false
      t.text :brief_summary
      t.text :extended_content
      t.integer :difficulty_level, null: false, default: 0
      t.integer :position, null: false, default: 0

      t.timestamps
    end
    add_index :concepts, :slug, unique: true
    add_index :concepts, [ :domain_id, :position ]
    add_index :concepts, [ :domain_id, :difficulty_level ]
  end
end
