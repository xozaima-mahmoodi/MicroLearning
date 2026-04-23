class AddViewsCountToConcepts < ActiveRecord::Migration[8.0]
  def change
    add_column :concepts, :views_count, :integer, default: 0, null: false
    add_index :concepts, :views_count
  end
end
