class AddColorAndIconToDomains < ActiveRecord::Migration[8.0]
  def change
    add_column :domains, :color, :string
    add_column :domains, :icon, :string
  end
end
