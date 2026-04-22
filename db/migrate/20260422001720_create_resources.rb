class CreateResources < ActiveRecord::Migration[8.0]
  def change
    create_table :resources do |t|
      t.references :concept, null: false, foreign_key: true
      t.string :title, null: false
      t.string :author
      t.string :link, null: false
      t.integer :resource_type, null: false, default: 0
      t.integer :position, null: false, default: 0

      t.timestamps
    end
    add_index :resources, [ :concept_id, :position ]
  end
end
