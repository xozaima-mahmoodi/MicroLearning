class RemoveLegacyTextColumnsFromTranslatedModels < ActiveRecord::Migration[8.0]
  # Mobility's key_value backend owns Category#title, Domain#name/description
  # and Concept#title/brief_summary/extended_content. The original columns
  # were left in place by the install migration but never written to again,
  # which made their NOT NULL constraints fire on every insert. Drop the
  # constraints (and the unique index on domains.name) so the columns become
  # passive remnants until a follow-up cleanup removes them entirely.
  def up
    change_column_null :categories, :title, true
    change_column_null :domains,    :name,  true
    change_column_null :concepts,   :title, true

    if index_exists?(:domains, :name, unique: true)
      remove_index :domains, name: "index_domains_on_name"
    end
  end

  def down
    change_column_null :categories, :title, false
    change_column_null :domains,    :name,  false
    change_column_null :concepts,   :title, false

    add_index :domains, :name, unique: true unless index_exists?(:domains, :name, unique: true)
  end
end
