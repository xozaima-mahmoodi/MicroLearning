class CreateUserActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :user_activities do |t|
      t.string :user_id, null: false
      t.references :concept, null: false, foreign_key: true
      t.date :activity_date, null: false

      t.timestamps
    end

    add_index :user_activities, [ :user_id, :activity_date ]
    add_index :user_activities,
              [ :user_id, :concept_id, :activity_date ],
              unique: true,
              name: "idx_user_activities_uniq"
  end
end
