Lotus::Model.migration do
  change do
  	create_table :articles do
      primary_key :id

      column :user_id, Integer
      column :title, String, null: false
      column :content, String
      column :created_at, DateTime
      column :updated_at, DateTime
    end

  end
end
