class CreateConceptRelations < ActiveRecord::Migration[8.0]
  def change
    create_table :concept_relations do |t|
      t.references :source_concept, null: false, foreign_key: { to_table: :concepts }
      t.references :target_concept, null: false, foreign_key: { to_table: :concepts }

      t.timestamps
    end
    add_index :concept_relations, [ :source_concept_id, :target_concept_id ], unique: true, name: :idx_concept_relations_unique_pair
    add_check_constraint :concept_relations, "source_concept_id <> target_concept_id", name: :no_self_loop
  end
end
